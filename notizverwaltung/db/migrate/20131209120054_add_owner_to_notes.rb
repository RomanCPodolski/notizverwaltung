class AddOwnerToNotes < ActiveRecord::Migration
  def change
  	add_reference :notes, :user, index: true
  end
end
