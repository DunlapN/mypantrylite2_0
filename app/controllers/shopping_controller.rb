class ShoppingController < ApplicationController

def index
  meals = Meal.where(user_id: current_user.id).where("scheduled_date >= ?", Date.today)
  foods_needed = []
  meals.each do |meal|
    foods_needed << meal.recipe.foods
  end

  foods_needed = foods_needed.flatten.uniq

  pantry_items = PantryItem.where(userid: current_user.id)
  food_on_hand = []
  pantry_items.each do |item|
    food_on_hand << item.food
  end

  food_on_hand = food_on_hand.uniq

  @grocery_list = foods_needed - food_on_hand


end


# Meal.where("meals.user_id = ? AND date = ?", current_user.id, Date.today)
# 11:48 AMBenjamin BlockUser.where("lower(email) LIKE ?", "%block%")




end
