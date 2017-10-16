class TurnsController < ApplicationController
  def clock
    game_name = params[:game_name]
    game = Match.find_by(name: game_name)
    if game.blank?
      render json: {status: "game not found"}
    else if game.ended?
      render json: {status: "game finished"}
    else
      engine = GameEngine.new(game)
      engine.step!
      render json: {status: "game stepped"}
    end
  end
end
