class AddTelegramToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :telegram, :boolean, default: true
    add_index :places, :telegram
  end
end
