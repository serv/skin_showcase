class AddChromasToSkins < ActiveRecord::Migration[5.0]
  def change
    add_column :skins, :chromas, :boolean
  end
end
