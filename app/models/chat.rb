class Chat < ApplicationRecord
  belongs_to :car
  has_many :messages
  validates :car, :message, presence: true
end
