class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.string :imgurl
      t.string :description
      t.integer :restaurant_id
      t.float :price
      t.string :name


      t.timestamps
    end
  end
end
