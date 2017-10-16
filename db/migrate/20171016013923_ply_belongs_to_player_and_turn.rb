class PlyBelongsToPlayerAndTurn < ActiveRecord::Migration[5.1]
  def change
    add_reference :plies, :player
    add_reference :plies, :turn
  end
end
