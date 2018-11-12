class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :hours
      t.string :location
      t.string :phone

      t.timestamps
    end
  end
end
