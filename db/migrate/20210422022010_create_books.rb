class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false, unique: true
      t.string :authors, null: false
      t.string :description, null: false
      t.string :isbn, null: false, unique: true
      t.string :cover_url, null: false
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
