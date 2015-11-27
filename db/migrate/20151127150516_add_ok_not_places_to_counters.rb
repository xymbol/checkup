class AddOkNotPlacesToCounters < ActiveRecord::Migration
  def change
    add_column :counters, :ok_places, :integer
    add_column :counters, :not_places, :integer
  end
end
