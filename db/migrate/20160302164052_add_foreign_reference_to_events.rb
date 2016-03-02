class AddForeignReferenceToEvents < ActiveRecord::Migration
  def change
   add_reference :proposals, :event, index: true
   add_foreign_key :proposals, :event 
  end
end
