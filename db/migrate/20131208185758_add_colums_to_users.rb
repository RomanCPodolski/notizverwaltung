# This migration adds the colums Provider (string), uid (string) and name (string)
# to the database table Users.
#
# Author: Roman C. Podolski - podolski@hm.edu
class AddColumsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
  end
end
