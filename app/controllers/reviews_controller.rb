class ReviewsController < ApplicationController
  before_action :set_restaurant

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end
  def create
    @review = @restaurant.reviews.new(review_params)
    if @review.save
      redirect_to restaurant_reviews_path(@restaurant), notice: 'Review was successfully created.'
    else
      render :new
    end
  end
  private
  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
