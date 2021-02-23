class PaintingsController < ApplicationController
  before_action :set_painting, only: [:show, :edit, :update, :destroy]

  def index
    @paintings = Painting.all
  end

  def show
  end

  def new
    @painting = Painting.new
  end

  def create
    @painting = Painting.new(painting_params)

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
    params.require(:painting).permit(:title, :type, :height, :width, :price_cents_per_day, :location, :description, :photo)
  end

  def set_painting
    @painting = Painting.find(params[:id])
  end
end
