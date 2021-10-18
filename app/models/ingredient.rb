class Ingredient < ApplicationRecord

  UNITS = %w(g ml EL TL)

  belongs_to :recipe
end
