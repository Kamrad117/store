class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.text :notes
      t.integer :price
      t.integer :delivery_id

      t.timestamps
    end
  end
end
