class Recipe < ApplicationRecord
  # Direct associations

  has_many   :ingredients,
             :dependent => :destroy

  belongs_to :creator,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :creator_id, :presence => true

  validates :name, :presence => true

end
