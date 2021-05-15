class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update]

  def new
    @booking = Booking.new
  end

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
    @review = Review.new
    @garden = @booking.garden
  end

  def index
    @bookings = Booking.all
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

  def edit; end

  def update
    @booking.update(booking_params)
    if @booking.save
      render :show
    else
      render :edit
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:date, :user_id, :garden_id)
  end
end
