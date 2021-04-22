class SerializableBook < JSONAPI::Serializable::Resource
  type 'books'

  attributes :title, :description, :isbn, :cover_url, :pages,  :published_on

  belongs_to :author
  belongs_to :genre
  has_many :libraries, through: :inventories do
    data do
      @object.libraries
    end

    meta do
      { count: @object.libraries.count }
    end
  end

  meta do
    { featured: true }
  end
end
