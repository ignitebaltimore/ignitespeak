class AddArchivedToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :archived, :boolean, default: false, null: false
  end
end
