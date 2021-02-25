class Booking < ApplicationRecord
  belongs_to :painting
  belongs_to :user

  validates :start_date, :end_date, presence: true
  validate :start_not_after_end_date

  def start_not_after_end_date
    if end_date.present? && start_date > end_date
      errors.add(:start_date, "cannot be after the end date")
    end
  end
end
