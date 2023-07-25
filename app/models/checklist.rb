class Checklist < ApplicationRecord
  belongs_to :workspace
  has_many :sections, dependent: :destroy

  validates :name, presence: true
  validates :workspace, presence: true
end
