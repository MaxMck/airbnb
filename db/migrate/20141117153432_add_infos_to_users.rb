class AddInfosToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :text
    add_column :users, :last_name, :text
    add_column :users, :email_adress, :text
    add_column :users, :password, :text
    add_column :users, :description, :text
  end
end
