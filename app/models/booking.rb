class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :garden
  has_many :reviews, dependent: :destroy

  validates :date,  uniqueness: { scope: :garden,
  message: "Sorry this day is already taken! Try other days" }
end
