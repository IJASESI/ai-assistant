class Chat < ApplicationRecord
  acts_as_chat

  belongs_to :car
  has_many :messages, dependent: :destroy
  validates :car, presence: true
end
