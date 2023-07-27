class Workspace < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id, required: true
  has_many :checklists, dependent: :destroy
end
