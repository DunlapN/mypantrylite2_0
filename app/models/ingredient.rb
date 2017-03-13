class Ingredient < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :recipe_id, :presence => true

end
