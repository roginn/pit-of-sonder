class Ply < ApplicationRecord
  belongs_to :player
  belongs_to :turn

  def self.create_from_params(params, turn, player)
    ply = Ply.new(turn: turn, player: player)
    ply.move["action"] = params["action"]
    case ply.move["action"]
    when "move" then ply.move["direction"] = params["direction"]
    end
    ply.save!
  end
end
