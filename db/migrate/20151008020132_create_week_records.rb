class CreateWeekRecords < ActiveRecord::Migration
  def change
    create_table :week_records do |t|
      t.belongs_to :user, class_name: "User"
      t.integer :wins
      t.integer :losses
      t.belongs_to :week, class_name: "Week"

      t.timestamps null: :false
    end
  end
end