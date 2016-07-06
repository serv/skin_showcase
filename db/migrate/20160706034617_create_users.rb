class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :salted_password
      t.string :email
      t.string :ref_owned_skins
      t.string :ref_wanted_skins
      t.string :ref_ratings
      t.string :ref_comments
      t.string :ref_friends

      t.timestamps
    end
  end
end
