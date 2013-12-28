class AddAuthorAndSignedToToNotes < ActiveRecord::Migration
  def change

	change_table :notes do |t|
  		t.references :author
  		t.references :signed_to
  	end

  end
end
