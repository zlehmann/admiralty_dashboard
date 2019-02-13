class ChangeCaptainAdmiralIdToUserId < ActiveRecord::Migration[5.2]
  def change
    rename_column :captains, :admiral_id, :user_id
  end
end
