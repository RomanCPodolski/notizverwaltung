class AddStatusToNotes < ActiveRecord::Migration
  def change
    add_reference :notes, :status, index: true
  end
end
