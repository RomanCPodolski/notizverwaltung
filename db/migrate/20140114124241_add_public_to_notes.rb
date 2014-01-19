# This migration adds the colum "is_punlic" to the database table Notes
# "is_punlic" is a boolean value. If it's true, then the Note is visible for every user
# "is_public" is false, then the Note is only visible to it's author and and the person,
# who this note is assigned to
#
# Author: Roman C. Podolski
class AddPublicToNotes < ActiveRecord::Migration

  # Rund databease changes
  def change
  	add_column :notes, :is_public, :boolean
  end
end
