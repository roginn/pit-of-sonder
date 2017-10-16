class CreateInitialModels < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.timestamps
    end

    create_table :players do |t|
      t.string :name
      t.integer :pleasure
      t.integer :sorrow
      t.integer :juice
      t.timestamps
    end

    create_table :turns do |t|
      t.jsonb :board
      t.timestamps
    end

    create_table :plies do |t|
      t.jsonb :move
      t.timestamps
    end
  end
end
