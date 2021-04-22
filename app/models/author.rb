class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  # Finds or create author
  # @param name [String] (required)
  # @return [Author]
  def self.by_name(name)
    opts = { name: name }
    where(opts).first_or_create(opts)
  end
end
