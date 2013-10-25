namespace :weather do
  desc "update weather data on dailyweather models"
  #rake weather:fetch_todays_weather --trace
  task :fetch_todays_weather => :environment do
    #time to update
    def get_weather_from_lat_long(lat, long)
      if lat == "0.0" && long == "0.0"
        #default is folsom, CA
        lat = "38.6722"
        long = "-121.1578"
      end
      url = URI.parse("https://api.forecast.io/forecast/823b48b6f6dd0a89f9d669f34b98ba80/#{lat},#{long},#{Time.now.to_i}")
      puts url
      return JSON.parse(open(url).read)
    end
    updatehour = -1#TODO: eventually this can be put in a more flexible model user can edit
    a = Hash.new
    zipcode = []
    Board.all.where("zipcode != ''").each_with_index do |board, i|
      if zipcode.include? board.zipcode
        next
      else
        zipcode << board.zipcode
      end
      #TODO for each board see if it is time to update weather: 06:00
      t = ActiveSupport::TimeZone.new(board.timezone)
      last_update = Dailyweather.where(:zipcode => board.zipcode).last.try(:created_at).try(:day) || -1
      if t.now.hour > updatehour && last_update < t.now.day
        #This conditional is makins sure I am making sure I am updating at or slightly after the update hour and that the last update has happened yesterday or earlier
        today =  get_weather_from_lat_long(board.latitude,board.longitude)
        puts board.latitude
        puts board.longitude
        d = Dailyweather.new
        d.apisource           = "forcast.io"
        d.zipcode             = board.zipcode
        d.maxtemp             = today['daily']['data'][0]['temperatureMax'].to_f.round
        d.mintemp             = today['daily']['data'][0]['temperatureMin'].to_f.round
        d.wind                = today['daily']['data'][0]['windSpeed'].to_f.round
        d.precipitationprob   = today['daily']['data'][0]['precipProbability'].to_i
        #d.precipitation_actual # don't have actuals since this is prediction
        d.actual              = false
        d.summary             = today['daily']['data'][0]['summary']
        if d.save
          puts d.inspect
          #cool
        else
          puts "could not save. =>\n#{d.errors.full_messages}"
        end

        #.....to be continued.
        
        # 
        # t.string   "apisource",            default: "",    null: false
        # t.integer  "maxtemp"
        # t.integer  "mintemp"
        # t.integer  "wind"
        # t.integer  "precipitationprob"
        # t.integer  "precipitation_actual"
        # t.boolean  "actual",               default: false, null: false
        # t.string   "summary",              default: "",    null: false
      end 
      #If so fetch a weather update for that location
    end
  end#task
end#namespace
