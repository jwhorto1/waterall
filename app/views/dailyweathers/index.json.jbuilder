json.array!(@dailyweathers) do |dailyweather|
  json.extract! dailyweather, :apisource, :maxtemp, :mintemp, :wind, :precipitationprob, :precipitation_actual, :actual, :summary, :zipcode
  json.url dailyweather_url(dailyweather, format: :json)
end
