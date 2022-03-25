class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :name, limit: 100
      t.integer :price
      t.integer :grade
      t.integer :qty
      t.text :image_url

      t.timestamps
    end
  end
end
