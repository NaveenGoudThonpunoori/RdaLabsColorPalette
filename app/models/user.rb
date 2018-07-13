class User < ApplicationRecord
  has_many :grids, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
