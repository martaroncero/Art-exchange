class PaintingsController < ApplicationController

  def edit
  end

  def update
    @painting.update(painting_params)
    redirect_to painting_path(@painting)
  end

  def destroy
    @painting.destroy
    redirect_to paintings_path
  end

end
