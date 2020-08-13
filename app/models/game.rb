class Game < ApplicationRecord
  belongs_to :type
  belongs_to :gstate
  belongs_to :hometeam, class_name: 'Team'
  belongs_to :awayteam, class_name: 'Team'
end
