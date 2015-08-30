class Team < ActiveRecord::Base
  has_many :teams
  has_many :games

  validates :name, presence: true
  mount_uploader :team_logo, AvatarUploader
end
