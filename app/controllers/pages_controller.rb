class PagesController < ApplicationController
  def home
    @gardens = Garden.all
    @reviews = Review.all
  end
end
