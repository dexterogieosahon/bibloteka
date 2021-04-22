class SerializableAuthor < JSONAPI::Serializable::Resource
  type 'author'

  attributes :name
end