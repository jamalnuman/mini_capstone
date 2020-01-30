class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :admin, :boolean, default: false#this will be false to new accounts unless permitted by administrator
  end
end
