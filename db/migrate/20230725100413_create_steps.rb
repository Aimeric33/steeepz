class CreateSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :steps do |t|
      t.string :title
      t.text :details
      t.date :estimated_end_date
      t.boolean :completed
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
