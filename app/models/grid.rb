class Grid < ApplicationRecord
  belongs_to :user
  validates :color, presence: true
  validates :position, presence: true
end
