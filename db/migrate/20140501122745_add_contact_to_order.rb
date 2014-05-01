class AddContactToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :contact, :text
  end
end
