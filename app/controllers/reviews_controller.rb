class ReviewsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]

  # GET /restaurants/:restaurant_id/reviews/new
  def new
    # @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  # POST /restaurants/:restaurant_id/reviews
  def create
    # get the restaurant with params[:restaurant_id]
    # @restaurant = Restaurant.find(params[:restaurant_id])
    # create the review with content from form
    @review = Review.new(review_params)
    # Add the resatruant to review
    @review.restaurant = @restaurant
    # save it
    if @review.save
      # redirect to the restaurant show page
      redirect_to restaurant_path(@restaurant), notice: "Successfully created review 🎉"
    else
      render :new, status: :unprocessable_entity
    end
    
  end

  # DELETE /reviews/:id
  def destroy
    # find the review
    @review = Review.find(params[:id])
    # destroy the review
    @review.destroy
    # redirect to wherever we want (restaurant show page)
    redirect_to restaurant_path(@review.restaurant), notice: "Successfully destroyed review", status: :see_other
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
