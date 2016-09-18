class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.integer :skin_id
      t.integer :user_id
      t.integer :review_id
      t.integer :score

      t.timestamps
    end
  end
end
