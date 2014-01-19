# This migration will add the colum heading (string) to the table comments
class AddHeadingToComment < ActiveRecord::Migration
  def change
    add_column :comments, :heading, :string
  end
end
