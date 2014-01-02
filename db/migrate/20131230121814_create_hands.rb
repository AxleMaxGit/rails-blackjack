class CreateHands < ActiveRecord::Migration
  def change
    create_table :hands do |t|
      t.integer :player_id
      t.integer :card_id
      t.integer :hand_id
      t.integer :game_id

      t.timestamps
    end
  end
end
