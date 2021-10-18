class Review < ApplicationRecord
  belongs_to :recipe, foreign_key: :recipe_id

  scope :by_recipe, -> (recipe_id) { where(recipe_id: recipe_id) }
end
