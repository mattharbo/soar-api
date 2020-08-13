class Type < ApplicationRecord
  has_many :games, dependent: :destroy
end
