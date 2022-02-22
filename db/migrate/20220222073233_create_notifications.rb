class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :visitor_id, null: false, foreign_key: true
      t.integer :visited_id, null: false, foreign_key: true
      t.references :blog, foreign_key: true
      t.references :comment, foreign_key: true
      t.string :action, default: '', null: false
      t.boolean :checked, default: false, null: false

      t.timestamps
    end
  end
end
