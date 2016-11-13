class AddUrlIdToChampions < ActiveRecord::Migration[5.0]
  def change
    add_column :champions, :original_id, :string
    add_column :champions, :url_id, :string
  end
end
