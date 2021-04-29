class Booking < ApplicationRecord
  validates :start_date, :end_date, presence: true
  validate :start_not_after_end_date

  belongs_to :painting
  belongs_to :user

  def start_not_after_end_date
    if start_date.present? && end_date.present? && start_date > end_date
      errors.add(:end_date, "cannot be before the start date")
    end
  end
end
