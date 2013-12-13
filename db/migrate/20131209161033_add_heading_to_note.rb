class AddHeadingToNote < ActiveRecord::Migration
  def change
    add_column :notes, :heading, :string
  end
end
