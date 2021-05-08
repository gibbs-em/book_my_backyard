class Garden < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :title,  presence: true
  validates :description,  presence: true
  validates :address,  presence: true, uniqueness: true
  validates :postcode,  presence: true
end
