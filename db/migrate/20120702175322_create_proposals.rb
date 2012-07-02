class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :speaker_name, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.string :email, null: false
      t.string :phone
      t.text :bio, null: false
      t.string :website
      t.string :hash_code, null: false

      t.timestamps
    end

    add_index :proposals, :created_at
  end
end
