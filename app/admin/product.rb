ActiveAdmin.register Product do

  permit_params :exist, :name, :description, :price, :brand_id, :category_id, assets_attributes: [:image, :image_file_name, :image_content_type, :image_file_size, :image_updated_at, :_destroy, :id]
  menu label: proc{ I18n.t(:products)}, priority: 3, parent: "Content"


  sidebar proc{ t(:sidebar) }, only: [:show, :edit] do
    div do
      link_to t(:view_on_website), product_path(params[:id])
    end
  end

  index do
    selectable_column
    column t(:images) do |product|
      ul class: 'inline' do
        product.assets.each do |asset|
          li do
            image_tag(asset.image.url(:tiny))
          end
        end
      end
    end
    column t(:exist)
    column t(:name) do |product|
      link_to product.name, admin_product_path(product)
    end
    column t(:description) do |product|
      product.description.truncate(200)
    end
    column t(:price) do |product|
      product.price
    end
    default_actions
  end

  form multipart: true do |f|
    f.inputs "Детали" do
      f.input :category_id, as: :select, collection: Category.all, include_blank: false
      f.input :brand_id, as: :select, collection: Brand.all, include_blank: false

      f.input :name
      f.input :description, as: :ckeditor, label: false
      f.input :price
    end

    f.inputs 'Фотографии' do
      f.has_many :assets, allow_destroy: true, heading: 'Фото', new_record: true do |fasset|
        fasset.input :image, as: :file, hint: fasset.template.image_tag(fasset.object.image.url(:thumb))
      end
    end
    f.actions
  end

    show title: :name do |product|
      attributes_table do
        row t(:category) do
          product.category
        end
        row t(:brand) do
          product.brand
        end
        row t(:price) do
          product.price
        end
        row t(:description) do
          product.description
        end
        row t(:assets) do
          ul do
          product.assets.each do |asset|
            li do
             image_tag(asset.image.url(:thumb))
           end
          end
         end
        end
        row :created_at
      end
      active_admin_comments
    end

end

