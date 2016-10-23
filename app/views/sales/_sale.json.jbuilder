json.extract! sale, :id, :title, :percent, :description, :created_at, :updated_at
json.url sale_url(sale, format: :json)