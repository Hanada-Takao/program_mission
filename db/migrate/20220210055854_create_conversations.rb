class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|
      t.bigint :sender_id, null: false, foreign_key: true
      t.bigint :recipient_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
