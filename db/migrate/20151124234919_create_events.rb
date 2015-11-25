class CreateEvents < ActiveRecord::Migration

	def change
	  	create_table :events do |t|
	  		t.string :title, null: false
			t.datetime :date, null: false
			t.string :tickets, null: false
	  		
	  		t.timestamps
	  	end
	end

end