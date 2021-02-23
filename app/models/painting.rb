class Painting < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo


  validates :title, :price_cents_per_day, :width, :height, :category, :location, presence: true
  validates :width, :height, :price_cents_per_day, numericality: { only_integer: true }
end
