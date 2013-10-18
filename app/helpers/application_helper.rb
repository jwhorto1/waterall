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
      long = "-121.1578"
    end
    url = URI.parse("https://api.forecast.io/forecast/823b48b6f6dd0a89f9d669f34b98ba80/#{lat},#{long},#{Time.now.to_i}")
    return JSON.parse(open(url).read)
  end
  def image_sprite(image, options = {}) 
      sprites = {
        :add_icon           => {:w => 16,   :h => 16,   :x => 0,    :y => 0},
        :email              => {:w => 26,   :h => 16,   :x => 41,   :y => 0},
        :print              => {:w => 25,   :h => 17,   :x => 68,   :y => 0},
        :trash              => {:w => 10,   :h => 11,   :x => 94,   :y => 0},
        :comments           => {:w => 13,   :h => 13,   :x => 105,  :y => 0},
        :comments_read      => {:w => 13,   :h => 13,   :x => 120,  :y => 0},
        :comments_unread    => {:w => 13,   :h => 13,   :x => 135,  :y => 0},
        :rss                => {:w => 14,   :h => 14,   :x => 150,  :y => 0},
        :ical               => {:w => 14,   :h => 16,   :x => 166,  :y => 0},
        :drag               => {:w => 11,   :h => 11,   :x => 360,  :y => 0},
        :timeclock          => {:w => 17,   :h => 17,   :x => 375,  :y => 0},
        :timeclock_off      => {:w => 17,   :h => 17,   :x => 392,  :y => 0}
      }
      %(<span class="sprite #{options[:class]}" style="background: url(#{path_to_image('/images/meteocons.png')}) no-repeat -#{sprites[image][:x]}px -#{sprites[image][:y]}px; width: #{sprites[image][:w]}px; padding-top: #{sprites[image][:h]}px; #{options[:style]}" title="#{options[:title]}">#{options[:title]}</span>)
    end
 
end
