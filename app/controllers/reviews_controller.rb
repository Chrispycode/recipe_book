class ReviewsController < ApplicationController
  protect_from_forgery with: :exception

  def create
    @review = Review.create!(review_params)
    render json: average_rating
  end

  private

  def review_params
    params.require(:review).permit(:recipe_id, :rating)
  end

  def average_rating
    reviews = Review.by_recipe(params[:recipe_id])
    if reviews.size > 1
      reviews.average(:rating)&.round(2)
    else
      reviews.first.rating
    end
  end
end
