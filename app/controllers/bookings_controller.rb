class BookingsController < ApplicationController
  
  before_action :set_painting, only: [:create]

  def create
    @booking = Booking.new(booking_params)
    @booking.painting = @painting
    @booking.user = current_user

    if @booking.save
      redirect_to booking_path(@booking)
    else
      respond_to do |format|
        format.js { render 'bookings/form/form_reload.js.erb' }
      end
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
