class AddIndexOnValueToChecks < ActiveRecord::Migration
  def change
    add_index :checks, :value
  end
end
