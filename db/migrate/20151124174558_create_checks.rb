class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.references :user, index: true, foreign_key: true
      t.references :place, index: true, foreign_key: true
      t.string :value

      t.timestamps null: false
    end
  end
end
