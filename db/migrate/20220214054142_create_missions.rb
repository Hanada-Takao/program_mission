class CreateMissions < ActiveRecord::Migration[6.0]
  def change
    create_table :missions do |t|
      t.string :input_main, null: false
      t.string :input_reading
      t.string :input_library
      t.string :input_alias
      t.string :input_related
      t.string :input_sample
      t.text :input_description
      t.string :input_reference_site
      t.text :input_remarks
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
