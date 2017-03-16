class ShoppingController < ApplicationController

def index
  food_needed = Meal.where(user_id: current_user.id && date: >= Date.today).ingredients.foods.ids
  food_on_hand = Pantry_item.where(user_id: current_user.id).food.ids
  @grocery_list = food_needed - food_on_hand


end





end
