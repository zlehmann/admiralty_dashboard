class ChangeUsersForGithuboauth < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :image
    remove_column :users, :email
    add_column :users, :provider, :string
  end
end
