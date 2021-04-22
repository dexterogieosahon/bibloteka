class BooksController < ApplicationController
  deserializable_resource :books, only: [:index]

  # GET /books
  # GET /books?library=library-name
  def index
    render jsonapi: Book.search(params), include: [:genre, :author, :libraries]
  end

end
