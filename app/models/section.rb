class Section < ApplicationRecord
  belongs_to :checklist
  has_many :steps, dependent: :destroy
  acts_as_list scope: :checklist

  validates :title, presence: true
  validates :checklist, presence: true
  validates :position, presence: true
end
