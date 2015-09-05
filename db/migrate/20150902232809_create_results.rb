class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.belongs_to :game, class_name: "Game"
      t.integer :winner
      t.integer :loser
    end
  end
end
