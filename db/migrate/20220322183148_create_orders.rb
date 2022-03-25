class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :name, limit: 50
      t.string :email, limit: 50
      t.string :address, limit: 100
      t.string :city, limit: 50
      t.string :district, limit: 20
      t.integer :mobile_no
      t.integer :item_count
      t.integer :total_amount

      t.timestamps
    end
  end
end
