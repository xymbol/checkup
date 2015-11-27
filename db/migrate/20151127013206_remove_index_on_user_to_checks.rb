class RemoveIndexOnUserToChecks < ActiveRecord::Migration
  def change
    remove_index :checks, :user_id
  end
end
