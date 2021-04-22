class Library < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :books, through: :inventories
end
