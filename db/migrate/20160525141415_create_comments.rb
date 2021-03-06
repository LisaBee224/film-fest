class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.boolean :flag
      t.references :user, null: false, index: true
      t.references :review, null: false, index: true

      t.timestamps null: false
    end
  end
end
