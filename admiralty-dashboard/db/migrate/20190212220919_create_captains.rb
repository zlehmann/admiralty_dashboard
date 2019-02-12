class CreateCaptains < ActiveRecord::Migration[5.2]
  def change
    create_table :captains do |t|
      t.string :name
      t.integer :age
      t.integer :admiral_id
      t.integer :ship_id

      t.timestamps
    end
  end
end
