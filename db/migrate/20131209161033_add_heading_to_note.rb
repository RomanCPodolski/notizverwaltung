# This migration adds the Field Heading (string) to the database table notes
class AddHeadingToNote < ActiveRecord::Migration
  def change
    add_column :notes, :heading, :string
  end
end
