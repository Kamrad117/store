json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :price, :category_id, :brand_id
  json.url product_url(product, format: :json)
end
