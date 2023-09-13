class UpdateDefaultColumns < ActiveRecord::Migration[7.0]
  def change
    change_column_default :workspaces, :name, from: nil, to: "New workspace"
    change_column_default :checklists, :name, from: nil, to: "New checklist"
    change_column_default :checklists, :description, from: nil, to: "This is the description of the checklist"
  end
end
