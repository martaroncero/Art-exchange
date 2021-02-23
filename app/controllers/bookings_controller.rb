class BookingsController < ApplicationController
  

  def index
    @user = current_user
    @bookings = @user.bookings
    @bookings_through_paintings = @user.paintings_bookings
  end

  def show
    @booking = @user.bookings.find(params[:id])
  end
  


end