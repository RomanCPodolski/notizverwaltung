class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :commenter_id
      t.text :comment
      t.references :note, index: true

      t.timestamps
    end
  end
end