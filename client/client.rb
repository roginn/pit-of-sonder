require 'net/http'
require 'json'

class ExampleBot
  def initialize
    @name="example_bot"
  end

  def request(path, object)
    uri = URI("http://localhost:3000/#{path}")
    req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
    req.body = object.to_json
    response = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    if /^2\d\d$/ === response.code
      JSON.parse(response.body)
    else
      response.code.to_i
    end
  end

  def search_game
    request('new_game', {bot_name: @name})
  end

  def join_game(game_name)
    request("join_game/#{game_name}", {bot_name: @name})
  end
end

bot = ExampleBot.new
