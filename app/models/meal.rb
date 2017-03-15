class Meal < ApplicationRecord

  belongs_to :recipe,
             :counter_cache => true

  belongs_to :user,
             :class_name => "User",
             :counter_cache => true

  validates :recipe_id, :presence => true
  validates :user_id, :presence => true
end
