# This migration creates the database Tabel "Categories"
# === Fields
# Name (String) - description of the catergory
class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
