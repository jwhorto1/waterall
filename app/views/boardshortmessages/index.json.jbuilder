json.array!(@boardshortmessages) do |boardshortmessage|
  json.extract! boardshortmessage, :board_id, :randomaccesscode, :scalediv32, :date, :year, :month, :day, :hour, :minute, :second, :sendstatus, :echo, :willsend, :checksum, :concatinated_board_ascii
  json.url boardshortmessage_url(boardshortmessage, format: :json)
end
