class AddForemAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :forem_admin, :boolean
  end
end
