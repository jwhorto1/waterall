json.array!(@waterings) do |watering|
  json.extract! watering, :time, :version, :channel, :user_id
  json.url watering_url(watering, format: :json)
end
