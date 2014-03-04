json.array!(@boards) do |board|
  json.extract! board, :address, :zipcode, :boardshortmessage_id
  json.url board_url(board, format: :json)
end
