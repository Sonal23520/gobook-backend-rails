class ChangeColumnOrder < ActiveRecord::Migration[7.0]
  def change
    change_column :books, :created_at, :datetime, :after => 'products_id'
    change_column :books, :updated_at, :datetime, :after => 'created_at'
  end
end
