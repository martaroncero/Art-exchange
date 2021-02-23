class BookingsController < ApplicationController

  before_action :set_painting, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    booking = Booking.new(booking_params)
    booking.painting = @painting
    p current_user
    raise
    booking.user = current_user

    if booking.save
      redirect_to booking_path(booking)
    else
      render :new
    end
  end

  private

  def set_painting
    @painting = Painting.find(params[:painting_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
