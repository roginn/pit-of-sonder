class Match < ApplicationRecord
  has_many :turns
  has_many :players
  scope :first_not_started, -> { where(started: false).first }

  def last_turn
    self.turns.order(:created_at).last
  end
  
  def start!
      self.started = true
      save
  end
end
