class AddIndexOnUserPlaceToChecks < ActiveRecord::Migration
  def change
    add_index :checks, [:user_id, :place_id], unique: true
  end
end
