class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.integer :recipe_id
      t.date :scheduled_date
      t.integer :user_id

      t.timestamps

    end
  end
end
