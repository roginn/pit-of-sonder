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
    if bot_name.blank?
      return render json: { success: false, error: "Invalid bot name: #{bot_name}" }
    end

    game_id = params[:game_id].to_i
    match = Match.find(game_id)
    if match.blank?
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

    if @match.blank?
      return render inline: "Nobody waiting for a game to start!"
    end

    render "index"
  end

  def post_lobby
    match_id = params['game_id'].to_i
    @match = Match.find(match_id)
    unless @match.present?
      return render inline: "Match_id #{match_id} not found"
    end

    @match.start!
    render "started"
  end
end