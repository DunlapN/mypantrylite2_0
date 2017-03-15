class Recipe < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :ingredients,
             :dependent => :destroy

  has_many   :meals,
             :foreign_key => "recipe_id",
             :dependent => :destroy

  belongs_to :user,
             :class_name => "User",
             :counter_cache => true

  # Indirect associations

  has_many :foods, :through => :ingredients, :source => :food


  # Validations

  validates :creator_id, :presence => true

  validates :name, :presence => true

end
