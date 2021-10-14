class HomepageController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def imprint
    head :ok
  end

  def privacy
    head :ok
  end
end
