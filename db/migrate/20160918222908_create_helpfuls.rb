class CreateHelpfuls < ActiveRecord::Migration[5.0]
  def change
    create_table :helpfuls do |t|
      t.integer :user_id
      t.integer :review_id
      t.integer :upvote

      t.timestamps
    end
  end
end
