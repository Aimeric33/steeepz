class CreateChecklists < ActiveRecord::Migration[7.0]
  def change
    create_table :checklists do |t|
      t.string :name
      t.text :description
      t.string :icon
      t.date :start_date
      t.date :estimated_end_date
      t.references :workspace, null: false, foreign_key: true

      t.timestamps
    end
  end
end
