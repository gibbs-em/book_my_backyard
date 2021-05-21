class GardensController < ApplicationController
  before_action :set_garden, only: [:edit, :update, :destroy]

  def index
    @gardens = Garden.all
    @markers = @gardens.geocoded.map do |garden|
      {
        lat: garden.latitude,
        lng: garden.longitude,
        info_window: render_to_string(partial: "info_window", locals: { garden: garden })
      }
    end
  end

  def show
    @garden = Garden.find(params[:id])
    @booking = Booking.new

    @marker = {
                  lat: @garden.latitude,
                  lng: @garden.longitude,
                  info_window: render_to_string(partial: "info_window", locals: { garden: @garden })
                }
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
      redirect_to garden_path(@garden)
    else
      render :edit
    end
  end

  def destroy
    @garden.destroy
    redirect_to gardens_path
  end

  private

  def set_garden
    @garden = Garden.find(params[:id])
  end

  def garden_params
    # When editing a booking, simple form does not send "false", so if we update a garden to no have a bbq by unticking/false it does not send it
    # the below sets the 5 geature booleans to false if they are not sent in the edit form, ams ure there is abeeter way to do this though!
    params[:garden][:bbq] ||= false
    params[:garden][:toilet] ||= false
    params[:garden][:heater] ||= false
    params[:garden][:rain_shelter] ||= false
    params[:garden][:peaceful] ||= false

    params.require(:garden).permit(:title, :description, :address, :postcode, :bbq, :toilet, :heater, :rain_shelter, :peaceful, :photo, :price, :capacity)
  end
end
