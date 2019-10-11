json.extract! notification, :id, :filename, :category, :d_day, :created_at, :updated_at
json.url notification_url(notification, format: :json)
