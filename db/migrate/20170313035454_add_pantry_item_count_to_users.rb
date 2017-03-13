class AddPantryItemCountToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :pantry_items_count, :integer
  end
end
