class CreateCounters < ActiveRecord::Migration
  def change
    create_table :counters do |t|
      t.integer :users
      t.integer :checks
      t.integer :places
      t.integer :checked_places
      t.float :progress
      t.integer :ok_checks
      t.integer :not_checks

      t.timestamps null: false
    end
  end
end
