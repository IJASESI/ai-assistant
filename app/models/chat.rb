class Chat < ApplicationRecord
  belongs_to :car
  has_many :messages, dependent: :destroy
  validates :car, presence: true
end
