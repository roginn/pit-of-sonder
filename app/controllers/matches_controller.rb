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
    bot_name = params['bot_name'].to_s
    unless bot_name.present?
      return render json: { success: false, error: "Invalid bot name: #{bot_name}" }
    end

    game_id = params[:game_id].to_i
    match = Match.find_by(id: game_id)
    unless match.present?
      return render json: { success: false, error: "Match not found" }
    end

    if match.started
      return render json: { success: false, error: "Match already started" }
    end

    Player.find_or_create_by(match_id: game_id, name: bot_name)
    render json: { success: true }
  end

  def get_lobby
    @match = Match.first_not_started
    render "index"
  end

  def post_lobby
  end
end