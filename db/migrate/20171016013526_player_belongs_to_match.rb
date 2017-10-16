class PlayerBelongsToMatch < ActiveRecord::Migration[5.1]
  def change
    add_reference :players, :match, index: true
  end
end
