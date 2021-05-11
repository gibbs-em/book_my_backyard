class BookingsController < ApplicationController
  def create
    @garden = Garden.find(params[:garden_id])
    @booking = Booking.new(booking_params)
    @booking.garden = @garden
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render "gardens/show"
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def index
    @bookings = Booking.all
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :user_id, :garden_id)
  end
end
