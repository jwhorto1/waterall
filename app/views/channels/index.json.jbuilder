json.array!(@channels) do |channel|
  json.extract! channel, :board_id, :name, :number
  json.url channel_url(channel, format: :json)
end
