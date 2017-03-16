class PantryItem < ApplicationRecord
  # Direct associations

  belongs_to :food

  belongs_to :user,
             :foreign_key => "userid",
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :food_id , :presence => true, :uniqueness => {:scope => :userid}
  validates :userid , :presence => true

end
