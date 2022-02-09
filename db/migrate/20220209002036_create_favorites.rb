class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.bigint :user_id, null: false, foreign_key: true
      t.bigint :blog_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
