class Book < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :isbn, presence: true, uniqueness: true
  validates :description, presence: true
  validates :cover_url, presence: true
  validates :pages, presence: true
  validates :published_on, presence: true
  
  belongs_to :genre
  belongs_to :author
  has_many :inventories
  has_many :libraries, through: :inventories

  scope :in_library, -> (name) { includes(:libraries).where(libraries: { name: name }) }

  # @param params [Hash]
  # @return [Book::ActiveRecord_Relation]
  def self.search(params)
    params[:library] ? in_library(params[:library]) : all
  end
end
