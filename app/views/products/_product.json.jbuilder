json.extract! product, :id, :product_code, :name, :price, :quantity_discount, :price_discount, :created_at, :updated_at
json.url product_url(product, format: :json)
