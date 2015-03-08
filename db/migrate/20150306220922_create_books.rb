class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.integer :author_id
      t.integer :isbn
      t.integer :genre_id
      t.boolean :read

      t.timestamps
    end
  end
end
