class AddColumnsToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :provider, :string
    add_column :admins, :uid, :string
    add_column :admins, :name, :string
  end
end
