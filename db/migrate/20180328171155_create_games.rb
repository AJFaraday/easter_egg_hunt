class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :game_id
      t.integer :x
      t.integer :y
      t.boolean :completed

      t.timestamps
    end
  end
end
