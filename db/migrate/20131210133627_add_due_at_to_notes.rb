class AddDueAtToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :due_at, :date
  end
end
