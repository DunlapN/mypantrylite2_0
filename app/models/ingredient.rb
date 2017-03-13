class Ingredient < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :food_id, :presence => true

  validates :recipe_id, :presence => true

end
