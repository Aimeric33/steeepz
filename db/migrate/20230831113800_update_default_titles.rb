class UpdateDefaultTitles < ActiveRecord::Migration[7.0]
  def change
    change_column_default :steps, :title, from: nil, to: "Step title"
    change_column_default :sections, :title, from: nil, to: "Section title"
  end
end
