class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer :week_number
      t.datetime :week_start
      t.datetime :week_end
    end
  end
end
