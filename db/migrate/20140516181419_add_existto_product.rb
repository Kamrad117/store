class AddExisttoProduct < ActiveRecord::Migration
  def change
    add_column :products, :exist, :boolean, default: true
  end
end
