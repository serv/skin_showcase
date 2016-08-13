class ChangeSaltedPasswordToPasswordDigest < ActiveRecord::Migration[5.0]
  def change
    change_table :users do |t|
      t.rename :salted_password, :password_digest
    end
  end
end
