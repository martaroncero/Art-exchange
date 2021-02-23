class Painting < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, :price_cents_per_day, :width, :height, :location, presence: true
  validates :width, :height, :price_cents_per_day, numericality: { only_integer: true }

  CATEGORIES = ["Acrylic", "Egg Tempera", "Gouache", "Ink", "Oil", "Watercolour", "Mixed"]

  validates :category, inclusion: { in: CATEGORIES, message: "must be from the list" }
end
