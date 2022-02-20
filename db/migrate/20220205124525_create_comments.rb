class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: true
      t.references :blog, null: false, foreign_key: true
      t.string :comment_name, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
