class GardensController < ApplicationController
  before_action :set_garden, only: [:edit, :update]

  def index
    @gardens = Garden.all
  end

  def show
    @garden = Garden.find(params[:id])
  end

  def new
    @garden = Garden.new
  end

  def create
    @garden = Garden.new(garden_params)
    @garden.user = current_user
    if @garden.save
      redirect_to garden_path(@garden)
    else
      render :new
    end
  end

  def edit; end

  def update
    @garden.update(garden_params)
    if @garden.save
      render :show
    else
      render :edit
    end
  end

  private

  def set_garden
    @garden = Garden.find(params[:id])
  end
  
  def garden_params
    params.require(:garden).permit(:title, :description, :address, :postcode)
  end
end
