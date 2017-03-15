class Food < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_many   :ingredients,
             :dependent => :destroy

  has_many   :pantry_items,
             :dependent => :destroy

  # Indirect associations

  has_many :owners, :through => :pantry_items, :source => :user
  has_many :recipes, :through => :ingredients, :source => :recipe


  # Validations

  validates :name, :uniqueness => true

  validates :name, :presence => true

end
