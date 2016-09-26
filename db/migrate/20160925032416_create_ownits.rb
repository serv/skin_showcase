class CreateOwnits < ActiveRecord::Migration[5.0]
  def change
    create_table :ownits do |t|
      t.integer :user_id
      t.integer :skin_id

      t.timestamps
    end
  end
end
