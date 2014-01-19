# This migration drops the table comments
class DropComments < ActiveRecord::Migration
  def change
  	drop_table :comments
  end
end
