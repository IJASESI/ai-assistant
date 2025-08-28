class Chat < ApplicationRecord
  belongs_to :car
  has_many :messages, dependent: :destroy
  validates :car, :message, presence: true
end
