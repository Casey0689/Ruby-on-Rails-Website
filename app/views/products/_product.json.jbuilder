json.extract! product, :id, :name, :description, :quantity_on_hand, :low_price_range, :high_price_range, :cost_to_company, :shipping_weight, :thumb_image, :full_image, :created_at, :updated_at
json.url product_url(product, format: :json)
