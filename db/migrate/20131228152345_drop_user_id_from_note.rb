class DropUserIdFromNote < ActiveRecord::Migration
  def change
  	remove_reference :notes, :user
  end
end
