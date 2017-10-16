class Player < ApplicationRecord
  belongs_to :match
  has_many :plies
end
