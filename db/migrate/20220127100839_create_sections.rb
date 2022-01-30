class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.string :name, null: false
      t.references :subject, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true
      t.references :class_room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
