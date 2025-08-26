class Car < ApplicationRecord
  belongs_to :user
  has_one :chat
  validates :brand, :model, :year, presence: true
end
