json.array!(@boards) do |board|
  json.extract! board, :address, :zipcode
  json.url board_url(board, format: :json)
end
