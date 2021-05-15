class Garden < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  geocoded_by :address
  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true, uniqueness: true
  after_validation :geocode, if: :will_save_change_to_address?
end
