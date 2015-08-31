class Game < ActiveRecord::Base
  has_many :teams

  belongs_to :week

  validates :home_team_id, presence: true
  validates :away_team_id, presence: true
  validates :gametime_start, presence: true
  validates :week_game_id, presence: true
end
