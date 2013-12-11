class AddHeadingToComment < ActiveRecord::Migration
  def change
    add_column :comments, :heading, :string
  end
end
