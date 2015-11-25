class AddIndexOnUrlToPlaces < ActiveRecord::Migration
  def change
    add_index :places, :url, unique: true
  end
end
