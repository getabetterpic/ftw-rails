class CreateCategories < ActiveRecord::Migration
  def change
    Category.connection.execute('CREATE EXTENSION IF NOT EXISTS ltree;')
    create_table :categories do |t|
      t.string :name
      t.string :type
      t.integer :parent_id, index: true
      t.ltree :path

      t.timestamps null: false
    end
  end
end
