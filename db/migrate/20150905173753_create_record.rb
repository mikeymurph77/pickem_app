class CreateRecord < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.belongs_to :user, class_name: "User"
      t.integer :wins
      t.integer :losses
    end
  end
end
