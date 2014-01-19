# This migration adds the a Relation to the status table to the notes table
#
# Author: Janek Schoenwetter - schoenwe@hm.edu 
class AddStatusToNotes < ActiveRecord::Migration
  def change
    add_reference :notes, :status, index: true
  end
end
