class CreateCommentsNew < ActiveRecord::Migration
def change
    create_table :comments do |t|
      
      t.text :body
      t.references :note, index: true

      t.timestamps
    end
    add_reference :comments, :user, index: true
  end
end
