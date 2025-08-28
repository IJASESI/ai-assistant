class MessagesController < ApplicationController

  def create
    @chat = Chat.find(params[:chat_id])
    @message = Message.new(message_params)
    @message.role = "user"
    @message.chat = @chat
    if @message.save
      build_conversation_history
      @response = RubyLLM.chat.with_instructions(instructions).ask(@message.content)
      Message.create(role: "assistant", content: @response.content, chat: @chat)
      redirect_to chat_path(@chat)
    else
      render "chats/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def instructions
      car = @chat.car
      system_prompt = <<~PROMPT
        You are an Auto Mechanic. I am a person who has a problem with my car, which is a #{car.brand}, model #{car.model}, from the year #{car.year}.
        Help me break down my problem into small, actionable steps, giving solutions and advice.
        Answer concisely in markdown.
      PROMPT

      [system_prompt].compact.join("\n\n")
    end

  def build_conversation_history
    @ruby_llm_chat = RubyLLM.chat
    @chat.messages.each do |message|
    @ruby_llm_chat.add_message(
      role: message.role,
      content: message.content
     )
    end
  end
end
