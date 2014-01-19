# This migration adds the relation 'owner_id' to the database table notes
# 'owner_id' is a forein key to the table Users
class AddOwnerToNotes < ActiveRecord::Migration
  def change
  	add_reference :notes, :user, index: true
  end
end
