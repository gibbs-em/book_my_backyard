class Garden < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  geocoded_by :address
  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true, uniqueness: true
  after_validation :geocode, if: :will_save_change_to_address?
end
