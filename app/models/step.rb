class Step < ApplicationRecord
  belongs_to :section
  acts_as_list scope: :section

  validates :title, presence: true
  validates :position, presence: true
end
