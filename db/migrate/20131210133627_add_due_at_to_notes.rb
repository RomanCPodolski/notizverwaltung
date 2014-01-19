# This migration will add the field due_at(date) to the table notes
class AddDueAtToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :due_at, :date
  end
end
