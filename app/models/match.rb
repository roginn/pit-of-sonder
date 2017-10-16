class Match < ApplicationRecord
  has_many :turns
  has_many :players

  def last_turn
    self.turns.order(:created_at).last
  end
end
