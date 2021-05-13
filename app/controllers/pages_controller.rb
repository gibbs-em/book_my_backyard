class PagesController < ApplicationController
  def home
    @gardens = Garden.all
  end
end
