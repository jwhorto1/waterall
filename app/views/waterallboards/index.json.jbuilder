json.array!(@waterallboards) do |waterallboard|
  json.extract! waterallboard, :latitude, :longitude, :address, :zipcode, :boardnumber, :boardmodel, :person_id, :channels
  json.url waterallboard_url(waterallboard, format: :json)
end
