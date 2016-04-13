class AddNicknameToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :nickname, :string
  end
end
