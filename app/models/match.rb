class Match < ApplicationRecord
  has_many :turns
  has_many :players

  scope :first_not_started, -> { where(started: false).first }

  def start!
    self.started = true
    save
  end
end
