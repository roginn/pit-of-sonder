class GameEngine
  WIDTH = Turn::WIDTH
  HEIGHT = Turn::HEIGHT

  def initialize(game)
    @game = game
    @last_turn = game.last_turn
    @old_board = @last_turn.board
    @new_turn = Turn.new(match: game)
    @new_turn.board = JSON.parse(@last_turn.board.to_json)
    @new_board = @new_turn.board
  end

  def step!
    consider_all_moves
    actually_move_players
    execute_other_actions
    save_turn
  end

  def consider_all_moves
    @last_turn.plies.each do |ply|
      consider_move(ply.move) if ply.move["action"]=="move"
    end
  end

  def consider_move(move)
    player = find_player(@new_board, move.player.name)

    case move["direction"]
    when "north" then try_to_place(player, player["x"], (player["y"]+HEIGHT-1)%HEIGHT)
    when "south" then try_to_place(player, player["x"], (player["y"]+1)%HEIGHT)
    when "east" then try_to_place(player, (player["x"]+1)%WIDTH, player["y"])
    when "west" then try_to_place(player, (player["x"]+WIDTH-1)%WIDTH, player["y"])
    end
  end

  def try_to_place(player, x, y)
    if has_player_on(@old_board, x, y)
      player["new_x"]=player["x"]
      player["new_y"]=player["y"]
    else
      player["new_x"]=x
      player["new_y"]=y
    end
  end

  def has_player_on(board, x, y)
    board["players"].each do |player|
      return true if player["x"]==x && player["y"]==y
    end
    return false
  end

  def actually_move
    @new_board["players"].group_by do |player|
      [player["new_x"], player["new_y"]]
    end.filter do |k, v|
      v.size==1
    end.each do |_position, (player)|
      player["x"] = player["new_x"]
      player["y"] = player["new_y"]
    end

    @new_board["players"].each do |player|
      player.delete("new_x")
      player.delete("new_y")
    end
  end

  def execute_other_actions
  end

  def save_turn
    @new_turn.save!
  end

  def find_player(board, name)
    board["players"].find{|p| p["name"]==name}
  end
end
