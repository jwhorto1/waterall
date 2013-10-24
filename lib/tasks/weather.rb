namespace :weather do
  desc "update weather data on dailyweather models"
  #rake data:addlsdata --trace
  task :fetch_new_weather_data => :environment do
    #time to update
    updatehour = 5#TODO: eventually this can be put in a more flexible model user can edit
    a = Hash.new
    zone = []
    Board.all.where("zipcode != ''").each_with_index do |board, i|
      #TODO for each board see if it is time to update weather: 06:00
      t = ActiveSupport::TimeZone.new(board.timezone)
      last_update = Dailyweather.where(:zipcode => board.zipcode).last.try(:created_at).try(:day) || 0
      if t.now.hour > updatehour && last_update < t.now.day
        #This conditional is makins sure I am making sure I am updating at or slightly after the update hour and that the last update has happened yesterday or earlier
        d = Dailyweather.new
        d.apisource = "forcast.io"
        d.maxtemp  =
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
      if 
    end
    
    
    
    map{|b| a[b.latitude] = b.longitude, zone[i] }
    a.each_with_index do |location, i|
      puts location
      puts i
      
    end

   
  end#task
end#namespace
