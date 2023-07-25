class Step < ApplicationRecord
  belongs_to :section

  validates :title, presence: true

end
