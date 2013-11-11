json.array!(@dailyweatheractuals) do |dailyweatheractual|
  json.extract! dailyweatheractual, :maxtemp, :mintemp, :zipcode, :wind, :precipitation, :summary, :apicource
  json.url dailyweatheractual_url(dailyweatheractual, format: :json)
end
