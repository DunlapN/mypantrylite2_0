class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :creator_id
      t.string :image
      t.text :description

      t.timestamps

    end
  end
end
