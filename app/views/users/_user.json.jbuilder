json.extract! user, :id, :number, :grade, :class, :name, :kana, :gender, :pass, :created_at, :updated_at
json.url user_url(user, format: :json)
