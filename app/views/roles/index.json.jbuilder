json.array!(@roles) do |role|
  json.extract! role, :name, :description
  json.url role_url(role, format: :json)
end
