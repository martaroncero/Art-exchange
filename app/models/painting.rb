class Painting < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, :price_cents_per_day, :width, :height, :category, :location, presence: true
  validates :width, :height, :price_cents_per_day, numericality: { only_integer: true }

  CATEGORIES = ["Acrylic", "Egg Tempera", "Gouache", "Ink", "Oil", "Charcoal", "Graphite", "Chalk Pastel", "Watercolour", "Mixed" ]
  validates :category, inclusion: { in: CATEGORIES }
end
