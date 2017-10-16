Rails.application.routes.draw do

  controller 'matches' do
    post '/new_game' => :new_game
    post '/join_game/:game_id' => :join_game
    get  '/lobby' => :get_lobby
    post '/lobby' => :post_lobby
  end

  controller 'ply' do
    post '/current_state/:game_name' => :current_state
    post '/make_move/:game_name' => :make_move
  end

  controller 'turn' do
    post '/clock/:game_name' => :clock
  end

end
