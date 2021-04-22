class Inventory < ApplicationRecord
  belongs_to :book
  belongs_to :library

  # @param library [Library]
  # @param book [Book]
  # @param stock  [Integer]
  # @return [Inventory]
  def self.add_book_to_library(library, book, stock)
    inventory = new(library: library, book: book, stock: stock)
    inventory.save
  end
end
