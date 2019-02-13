class ChangeActionsTypeToActionTypeRemoveCaptid < ActiveRecord::Migration[5.2]
  def change
    rename_column :actions, :type, :action_type
    remove_column :actions, :captain_id
  end
end
