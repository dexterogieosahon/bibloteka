class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.belongs_to :book, null: false, foreign_key: true
      t.belongs_to :library, null: false, foreign_key: true
      t.integer :stock, null: false

      t.timestamps
    end
    add_index :inventories, [:book_id, :library_id], unique: true
  end
end
