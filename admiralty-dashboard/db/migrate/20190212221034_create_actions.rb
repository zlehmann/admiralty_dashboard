class CreateActions < ActiveRecord::Migration[5.2]
  def change
    create_table :actions do |t|
      t.integer :captain_id
      t.integer :ship_id
      t.string :type

      t.timestamps
    end
  end
end
