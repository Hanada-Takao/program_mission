class CreateMissionTagsRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :mission_tags_relations do |t|
      t.references :mission, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
