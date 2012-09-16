class AddSelectedToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :selected, :boolean, null: false, default: false
  end
end
