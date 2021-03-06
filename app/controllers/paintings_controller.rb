class PaintingsController < ApplicationController
  before_action :set_painting, only: [:show, :edit, :update, :destroy]

  def index
    @query = params[:query]
    if @query.present?
      @query.slice!("painting")
      @paintings = Painting.search_by_title_and_description_and_category(@query)
    else
      @paintings = Painting.all
    end
  end

  def show
    # for booking form, make the default dates today
    @booking = Booking.new
    @booking.start_date = Date.today
    @booking.end_date = Date.today

    if @painting.geocoded?
      @marker = {
        lat: @painting.latitude,
        lng: @painting.longitude,
        infoWindow: render_to_string(partial: 'shared/painting_card_content', locals: { painting: @painting })
      }
    end
  end

  def new
    @painting = Painting.new
  end

  def create
    @painting = Painting.new(painting_params)
    @painting.user = current_user

    if @painting.save
      redirect_to painting_path(@painting)
    else

      render :new
    end
  end

  def edit
  end

  def update
    if @painting.update(painting_params)
      redirect_to painting_path(@painting)
    else
      render :edit
    end
  end

  def destroy
    @painting.destroy
    redirect_to paintings_path
  end

  private

  def painting_params
    params.require(:painting).permit(:title, :category, :height, :width, :price_cents_per_day, :location, :description, :photo)
  end

  def set_painting
    @painting = Painting.find(params[:id])
  end
end
