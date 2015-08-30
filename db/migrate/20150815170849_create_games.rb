class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :gametime_start
      t.belongs_to :home_team, class_name: "Team"
      t.belongs_to :away_team, class_name: "Team"
      t.belongs_to :week_game, class_name: "Week"
    end
  end
end
