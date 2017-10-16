Rails.application.routes.draw do

  controller 'matches' do
    # post
    get '/new_game' => :new_game

    # post
    get '/join/:game_id' => :join_game
    get  '/lobby' => :get_lobby
    post '/lobby' => :post_lobby
  end

  controller 'plies' do
    post '/current_state/:game_name' => :current_state
    post '/make_move/:game_name' => :make_move
  end

  controller 'turns' do
    post '/clock/:game_name' => :clock
  end

end
