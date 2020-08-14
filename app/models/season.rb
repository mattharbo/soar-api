class Season < ApplicationRecord
  belongs_to :league
  has_many :game, dependent: :destroy
end
