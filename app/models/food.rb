class Food < ApplicationRecord
  # Direct associations

  has_many   :ingredients,
             :dependent => :destroy

  has_many   :pantry_items,
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :uniqueness => true

  validates :name, :presence => true

end
