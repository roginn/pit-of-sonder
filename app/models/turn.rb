class Turn < ApplicationRecord
  belongs_to :match
  has_many :plies
  WIDTH = 20
  HEIGHT = 20
  def get_player_view(player)
    p = find_player(player.name)
    raise 'wtf' if p.blank?
    { localization: {width: 20, height: 20, x: p["x"], y: p["y"]},
      feelings: {pleasure: 0, sorrow: 0, juice: 0},
      possesions: {potatoes: 0, dynamites: 0, stones: 0,
                  slot_1: nil, slot_2: nil, slot_3: nil},
      sights: get_sights(p),
      sounds: [] }
  end

  def find_player(name)
    board["players"].find{|p| p["name"]==name}
  end

  def get_sights(p)
    sights = []
    board["stuff"].each do |stuff|
      if b_distance(stuff, p)<=2
        sights << {x: stuff["x"],
                   y: stuff["y"],
                   type: "stuff",
                   name: stuff["name"]}
      end
    end
    board["players"].each do |other|
      if b_distance(other, p)<=2
        sights << {x: other["x"],
                   y: other["y"],
                   type: "player",
                   name: other["name"]}
      end
    end
    sights
  end

  def b_distance(thing1, thing2)
    [linear_distance(thing1["x"], thing2["x"], WIDTH),
     linear_distance(thing1["y"], thing2["y"], HEIGHT)].max
  end

  def linear_distance(d1, d2, limit)
    [(d1-d2+limit)%lim, (d2-d1+limit)%limit].min
  end
end
