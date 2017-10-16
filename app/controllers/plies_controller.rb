class PliesController < ApplicationController
  before_action :find_match
  before_action :find_player

  def current_state
    turn = @game.last_turn
    render json: turn.get_player_view(@player)
  end

  def make_move
    turn = @game.last_turn
    move = turn.plies.find_by(player: @player)
    if move.blank?
      Ply.create_from_params(params, @turn, @player)
      render json: {status: "nice move!"}
    else
      render json: {status: "already moved this turn"}
    end
  end

  def find_match
    @game = Match.find_by(name: params[:game_name])
    if @game.blank?
      render json: {status: "game not found"}
    elsif @game.ended?
      render json: {status: "game already ended"}
    elsif !@game.started?
      render json: {status: "game has not started yet"}
    end
  end

  def find_player
    @player = Match.players.find_by(name: params[:bot_name])
    if @player.blank?
      render json: {status: "player not found"}
    end
  end
end
