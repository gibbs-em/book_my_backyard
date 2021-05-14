class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @review.booking = @booking
    @review.booking.user = current_user
    if @review.save
      redirect_to booking_path(@booking)
    else
      render "booking/show"
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to garden_path
  end

  private

  def review_params
    params.require(:review).permit(:title, :description, :rating, :user_id, :booking_id)
  end
end
