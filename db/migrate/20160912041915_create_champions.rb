class CreateChampions < ActiveRecord::Migration[5.0]
  def change
    create_table :champions do |t|
      t.string :name
      t.string :key
      t.string :title

      t.timestamps
    end
  end
end
