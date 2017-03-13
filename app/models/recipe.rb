class Recipe < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :creator_id, :presence => true

  validates :name, :presence => true

end
