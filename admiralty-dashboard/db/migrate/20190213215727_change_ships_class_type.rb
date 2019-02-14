class ChangeShipsClassType < ActiveRecord::Migration[5.2]
  def change
    rename_column :ships, :class, :class_type
  end
end
