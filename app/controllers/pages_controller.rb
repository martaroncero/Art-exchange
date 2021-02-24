class PagesController < ApplicationController
  def home
    @random_paintings = Painting.all.sample(6)
  end
end
