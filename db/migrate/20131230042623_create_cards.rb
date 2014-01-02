class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.integer :cardrank
      t.string :cardsuit

      t.timestamps
    end
  end
end
