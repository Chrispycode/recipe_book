class ReviewsController < ApplicationController
  protect_from_forgery with: :exception

  def index
    render json: Review.by_recipe(params[:recipe_id]).average(:rating)&.round(2)
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
