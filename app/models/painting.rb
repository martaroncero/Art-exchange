class Painting < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  CATEGORIES = ["Acrylic", "Egg Tempera", "Gouache", "Ink", "Oil", "Watercolour", "Mixed"]
 
  validates :title, :price_cents_per_day, :width, :height, :location, presence: true
  validates :width, :height, :price_cents_per_day, numericality: { only_integer: true }
  validates :category, inclusion: { in: CATEGORIES, message: "must be from the list" }
  
  include PgSearch::Model
  pg_search_scope :search_by_title_and_description_and_category,
    against: [ :title, :description, :category, :location ],
    using: {
      tsearch: { prefix: true }
    }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
