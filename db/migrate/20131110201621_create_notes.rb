# This migration creates the database table notes
#
# == Fields
#
# message(string) - content of the node
# 
class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :message

      t.timestamps
    end
  end
end
