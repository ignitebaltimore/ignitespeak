class AddNameOfAttrForFilepickerUrlToProposal < ActiveRecord::Migration
  def change
    add_column :proposals, :filepicker_url, :string
  end
end
