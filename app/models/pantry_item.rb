class PantryItem < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :foreign_key => "userid",
             :counter_cache => true

  # Indirect associations

  # Validations

end
