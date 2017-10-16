class Turn < ApplicationRecord
  belongs_to :match
  has_many :plies
end
