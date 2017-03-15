class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.integer :meal_id
      t.date :time
      t.integer :user_id

      t.timestamps

    end
  end
end
