class CreateShips < ActiveRecord::Migration[5.2]
  def change
    create_table :ships do |t|
      t.string :name
      t.string :class
      t.integer :guns
      t.integer :captain_id

      t.timestamps
    end
  end
end
