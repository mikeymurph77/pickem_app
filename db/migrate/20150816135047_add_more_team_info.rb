class AddMoreTeamInfo < ActiveRecord::Migration
  def change
    add_column :teams, :city, :string
    add_column :teams, :team_logo, :string
  end
end
