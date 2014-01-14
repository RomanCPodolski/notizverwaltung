class AddPublicToNotes < ActiveRecord::Migration
  def change
  	add_column :notes, :is_public, :boolean
  end
end
