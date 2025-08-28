class ChatsController < ApplicationController
  # def index
  #   @car = Car.find(params[:car_id])
  #   @chats = @car.chat
  #   @chat = Chat.new
  # end

  def create
    @message = Message.new
    @car = Car.find(params[:car_id])
    @chat = Chat.new(title: "Untitled", model_id: "gpt-4.1-nano")
    @chat.car = @car
    if @chat.save
      redirect_to chat_path(@chat)
    else
      render :index
    end
  end

  def show
    @chat = Chat.find(params[:id])
    @car  = @chat.car
    @message = Message.new
  end

end
