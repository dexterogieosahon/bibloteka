class SerializableLibrary < JSONAPI::Serializable::Resource
  type 'library'

  attributes :name
end