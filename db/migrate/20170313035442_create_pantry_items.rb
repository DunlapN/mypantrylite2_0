class CreatePantryItems < ActiveRecord::Migration
  def change
    create_table :pantry_items do |t|
      t.integer :userid
      t.integer :food_id

      t.timestamps

    end
  end
end
