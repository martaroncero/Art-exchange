class BookingsController < ApplicationController
  
  before_action :set_painting, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    booking = Booking.new(booking_params)
    booking.painting = @painting
    booking.user = current_user

    if booking.save
      redirect_to booking_path(booking)
    else
      render :new
    end
  end

  def index
    @user = current_user
    @bookings = @user.bookings
    @bookings_through_paintings = @user.painting_bookings
  end

  def show
    @booking = Booking.find(params[:id])
    @painting = @booking.painting
  end

  private

  def set_painting
    @painting = Painting.find(params[:painting_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
