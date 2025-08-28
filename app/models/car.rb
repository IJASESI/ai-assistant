class Car < ApplicationRecord
  belongs_to :user
  has_many :chats, dependent: :destroy
  validates :brand, :model, :year, presence: true
end
