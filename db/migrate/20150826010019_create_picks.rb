class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.belongs_to :game, class_name: "Game"
      t.belongs_to :user, class_name: "User"
      t.belongs_to :picked_team, class_name: "Team"
    end
  end
end
