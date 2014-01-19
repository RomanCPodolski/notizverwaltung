# This migration adds the relation "cathegory_id" to the Notes table.
# "cathegory_id" is a foreign key to the cathegory table
#
# Author: Janek Schoenwetter - schoenwe@hm.edu
class AddCategoryToNotes < ActiveRecord::Migration
  def change
  	add_reference :notes, :category, index: true
  end
end
