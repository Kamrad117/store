class ChangeOrders < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.remove :contact
      t.string :cell_phone
      t.boolean :completed
    end
  end
end
