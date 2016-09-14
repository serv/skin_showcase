class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :skin_id
      t.string :title
      t.string :long_form

      t.timestamps
    end
  end
end
