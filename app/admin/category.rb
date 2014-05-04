ActiveAdmin.register Category do

  permit_params :name, :description

  menu label: proc{ I18n.t(:categories)}, priority: 4, parent: "Content"

  batch_action :destroy

  config.filters = false
  config.sort_order = "name_asc"

  sidebar "Sidebar", only: [:show, :edit] do |cat|
    div do
      link_to I18n.t(:name), category_path(cat.id)
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


end
