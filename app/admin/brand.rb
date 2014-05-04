ActiveAdmin.register Brand do

  permit_params :name
  menu label: proc{ I18n.t(:brands)}, priority: 2, parent: "Content"

  batch_action :destroy

  config.filters = false
  config.sort_order = "name_asc"

  sidebar "Sidebar", only: [:show, :edit] do
    div do
      link_to "I18n.t(:view_on_website)", category_path(params[:id])
    end
  end

  index do
    selectable_column
    column :name do |brand|
      link_to brand.name, admin_brand_path(brand)
    end
    column :description do |brand|
      brand.description
    end
    default_actions
  end


  show title: :name do |brand|
    attributes_table do
      row t(:description) do
        simple_format brand.description
      end
      row t(:products_count) do
        brand.products.count
      end
    end
    active_admin_comments
  end
end
