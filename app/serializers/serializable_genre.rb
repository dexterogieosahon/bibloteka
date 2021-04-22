class SerializableGenre < JSONAPI::Serializable::Resource
  type 'genre'

  attributes :name
end