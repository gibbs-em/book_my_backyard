class Review < ApplicationRecord
  belongs_to :booking

  validates :title, presence: true
  validates :description, presence: true
  validates :rating, presence: true
end
