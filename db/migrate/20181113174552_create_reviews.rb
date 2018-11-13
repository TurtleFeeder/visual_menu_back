class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.integer :meal_id
      t.string :content
      t.string :username

      t.timestamps
    end
  end
end
