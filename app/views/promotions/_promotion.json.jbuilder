json.extract! promotion, :id, :code, :min_total_price, :discount_rate, :includes_discount_item, :created_at, :updated_at
json.url promotion_url(promotion, format: :json)
