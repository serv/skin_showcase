class CreateWantits < ActiveRecord::Migration[5.0]
  def change
    create_table :wantits do |t|
      t.integer :user_id
      t.integer :skin_id

      t.timestamps
    end
  end
end
