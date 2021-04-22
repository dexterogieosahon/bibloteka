class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false, unique: true
      t.string :description, null: false
      t.string :isbn, null: false, unique: true
      t.string :cover_url, null: false
      t.integer :pages, null: false
      t.datetime :published_on, null: false
      t.belongs_to :author, null: false, index: true, foreign_key: true
      t.belongs_to :genre, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end    