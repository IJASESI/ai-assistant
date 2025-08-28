class Car < ApplicationRecord
  belongs_to :user
  has_one :chat, dependent: :destroy
  validates :brand, :model, :year, presence: true
end
