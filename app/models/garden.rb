class Garden < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  has_one_attached :photo

  geocoded_by :address
  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true, uniqueness: true
  validates :price, presence: true
  validates :capacity, presence: true
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :search_by_features,
    against: [ :toilet, :rain_shelter, :bbq, :heater, :peaceful ],
    using: {
      tsearch: { prefix: true }
    }
end
