class Week < ActiveRecord::Base
  has_many :games
  has_many :week_results

  validates :week_number, presence: true, uniqueness: true
end
