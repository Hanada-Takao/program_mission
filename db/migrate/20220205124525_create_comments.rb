class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.bigint :user_id, null: false, foreign_key: true
      t.bigint :blog_id, null: false, foreign_key: true
      t.string :comment_name, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
