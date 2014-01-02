class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :cardrank
      t.integer :cardvalue
      t.string :cardsuit

      t.timestamps
    end
  end
end
