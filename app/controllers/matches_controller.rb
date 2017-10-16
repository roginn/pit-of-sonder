class MatchesController < ApplicationController
  def new_game
    match = Match.find_or_create_by(started: false)
    response = {
      success: true,
      match_id: match.id
    }

    render json: response
  end

  def join_game
    game_id = params[:game_id].to_i
    match = Match.find_by(id: game_id)
    response = if match.present?
      {
        success: true
      }
    else
      {
        success: false,
        error: "Match not found"
      }
    end
    render json: response
  end

  def get_lobby
  end

  def post_lobby
  end
end