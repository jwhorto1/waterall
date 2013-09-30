json.array!(@boardshortmessages) do |boardshortmessage|
  json.extract! boardshortmessage, :board_id, :channel1_on_in_seconds, :channel2_on_in_seconds, :channel3_on_in_seconds, :channel4_on_in_seconds, :channel5_on_in_seconds, :channel6_on_in_seconds, :channel7_on_in_seconds, :channel8_on_in_seconds, :randomaccesscode, :scalediv32, :date, :year, :month, :day, :hour, :minute, :second, :channel1, :channel2, :channel3, :channel4, :channel5, :channel6, :channel7, :channel8, :sendstatus, :echo, :willsend, :checksum, :concatinated_board_ascii
  json.url boardshortmessage_url(boardshortmessage, format: :json)
end
