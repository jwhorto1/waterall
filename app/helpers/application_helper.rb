require 'open-uri'
module ApplicationHelper
  def get_state_and_city_from_zipcode(zipcode)
    #default is folsom CA
    zipcode = "95630" if zipcode == ""
    url = URI.parse("http://www.ziptasticapi.com/#{zipcode}")
    return JSON.parse(open(url).read)
  end
  def get_weather_from_lat_long(lat, long)
    if lat == "0.0" && long == "0.0"
      #default is folsom, CA
      lat = "38.6722"
      long = "121.1578"
    end
    url = URI.parse("https://api.forecast.io/forecast/823b48b6f6dd0a89f9d669f34b98ba80/#{lat},#{long},#{Time.now.to_i}")
    return JSON.parse(open(url).read)
  end
  
 
end
