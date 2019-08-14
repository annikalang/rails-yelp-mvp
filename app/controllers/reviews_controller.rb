class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create

    # STEP 1. LOOK INSIDE PARAMS HASH WITH RAISE
    # STEP 2. DEFINE WHAT WE NEED INSIDE OF A NEW REVIEW
      # CONTENT - RATING - RESTAURANT_ID

    # STEP 1. Add the user given part to the instance
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    # STEP 2. Grab the restaurant ID
    @review.restaurant = @restaurant

    if @review.save
      redirect_to restaurant_path(@review.restaurant)
    else
      render :new
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
