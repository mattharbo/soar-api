class Gstate < ApplicationRecord
  has_many :games, dependent: :destroy
end
