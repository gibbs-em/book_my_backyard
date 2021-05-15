class Garden < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy

  validates :title,  presence: true
  validates :description, presence: true
  validates :address, presence: true, uniqueness: true
  validates :postcode, presence: true
end
