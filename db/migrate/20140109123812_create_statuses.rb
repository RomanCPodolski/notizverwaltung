# This migration creates the Table Statuses
# === Fields
# name (String) - description of the status
#
# Author: Janek Schoenwetter - schoenwe@hm.edu
class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
