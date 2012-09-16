class AddPositionToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :position, :integer, null: false, default: 0
    add_index :proposals, :position
  end
end
