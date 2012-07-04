class MakeHashCodesUnique < ActiveRecord::Migration
  def change
    remove_index :proposals, :hash_code
    add_index :proposals, :hash_code, unique: true
  end
end
