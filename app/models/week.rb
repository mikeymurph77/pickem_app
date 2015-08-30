class Week < ActiveRecord::Base
  has_many :games

  validates :week_number, presence: true, uniqueness: true
end
