class Section < ApplicationRecord
  belongs_to :checklist
  has_many :steps, dependent: :destroy

  validates :title, presence: true
  validates :checklist, presence: true

end
