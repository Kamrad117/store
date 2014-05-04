ActiveAdmin.register Category do

  permit_params :name, :description

  menu label: proc{ I18n.t(:categories)}, priority: 4, parent: "Content"

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
    column :name do |cat|
      link_to cat.name, admin_category_path(cat)
    end
    column :description do |cat|
      cat.description
    end
    default_actions
  end


  show title: :name do |category|
    attributes_table do
      row t(:description) do
        simple_format category.description
      end
      row t(:products_count) do
        category.products.count
      end
    end
    active_admin_comments
  end
end
