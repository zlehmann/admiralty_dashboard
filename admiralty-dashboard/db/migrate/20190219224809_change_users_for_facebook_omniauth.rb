class ChangeUsersForFacebookOmniauth < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :age
    remove_column :users, :nationality
    add_column :users, :email, :string
    add_column :users, :image, :string
  end
end
