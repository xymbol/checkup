class AddCodeToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :code, :string
    add_index :places, :code, unique: true
  end
end
