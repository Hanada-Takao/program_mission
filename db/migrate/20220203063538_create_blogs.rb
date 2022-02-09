class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.bigint :user_id, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.string :image

      t.timestamps
    end
  end
end
