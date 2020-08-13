class Team < ApplicationRecord
  belongs_to :club
  has_many :hometeam_game, class_name: 'Game', foreign_key: 'hometeam_id'
  has_many :awayteam_game, class_name: 'Game', foreign_key: 'awayteam_id'
end
