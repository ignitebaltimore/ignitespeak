class AddIndexToProposals < ActiveRecord::Migration
  def change
    add_index :proposals, :hash_code
  end
end
