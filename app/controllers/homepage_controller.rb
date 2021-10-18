class HomepageController < ApplicationController
  def index
    @recipes = Recipe.with_attached_uploaded_image.order(created_at: :desc)
  end

  def imprint
    head :ok
  end

  def privacy
    head :ok
  end
end
