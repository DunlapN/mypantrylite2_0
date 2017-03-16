class AddMealsCountToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :meals_count, :integer
  end
end
