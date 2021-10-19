class ReviewsController < ApplicationController
  protect_from_forgery with: :exception

  def index
    reviews = Review.by_recipe(params[:recipe_id])
    render json: if reviews.size > 1
                   reviews.average(:rating)&.round(2)
                 else
                   reviews.first.rating
                 end
  end

  def create
    @review = Review.create!(review_params)
    render json: @review
  end

  private

  def review_params
    params.require(:review).permit(:recipe_id, :rating)
  end
end
