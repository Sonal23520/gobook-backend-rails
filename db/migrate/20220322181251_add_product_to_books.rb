class AddProductToBooks < ActiveRecord::Migration[7.0]
  def change
    add_reference :books, :products, null: false, foreign_key: true
  end
end
