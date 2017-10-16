Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  controller 'match' do
    post '/new_game'
    post '/join/:game_name'
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
