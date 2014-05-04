class AddDescriptionToBrand < ActiveRecord::Migration
  def change
    add_column :brands, :description, :text
  end
end
