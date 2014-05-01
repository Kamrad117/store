ActiveAdmin.register Order do

  permit_params :price, :user_id, :completed, :cell_phone, :notes, :delivery_id

end
