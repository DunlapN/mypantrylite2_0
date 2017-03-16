class Meal < ApplicationRecord

  belongs_to :recipe,
             :counter_cache => true

  belongs_to :user,
             :class_name => "User"

  validates :recipe_id, :presence => true
  validates :user_id, :presence => true
  validates :scheduled_date, :presence => true
end
