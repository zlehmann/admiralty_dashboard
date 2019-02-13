class AddActionIdToShips < ActiveRecord::Migration[5.2]
  def change
    add_column :ships, :action_id, :integer
  end
end
