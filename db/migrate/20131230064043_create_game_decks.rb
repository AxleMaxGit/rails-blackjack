class CreateGameDecks < ActiveRecord::Migration
  def change
    create_table :game_decks do |t|
      t.integer :basedeck_card_id
      t.boolean :dealt
      t.integer :game_id

      t.timestamps
    end
  end
end
