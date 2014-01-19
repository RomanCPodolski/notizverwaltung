# This migration creates the database table Comments
#
# == Fields
#
# commenter_id(int) - Foreign key to the table users
# body(string) - content of the comment
# note_id(int) - foreingkey to the table note
#
# Autor: Roman C. Podolski - podolsi@hm.edu
class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :commenter_id
      t.text :body
      t.references :note, index: true

      t.timestamps
    end
  end
end