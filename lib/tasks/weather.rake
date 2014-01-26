require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper
namespace :weather do
  desc "update weather data on dailyweather models"
  #rake weather:fetch_todays_weather_prediction --trace
  task :fetch_todays_weather_prediction => :environment do
    #time to update
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
      if t.now.hour > updatehour && last_update < t.now.day# get prediction
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
        d.summary             = today['daily']['data'][0]['summary']
        if d.save
          puts d.inspect
          #cool
        else
          puts "could not save. =>\n#{d.errors.full_messages}"
        end
      end #if
    end
  end#task
  task :fetch_todays_weather_actual => :environment do
    #rake weather:fetch_todays_weather_actual --trace
    updatehour = 0#TODO: eventually this can be put in a more flexible model user can edit
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
      last_update = Dailyweatheractual.where(:zipcode => board.zipcode).last.try(:created_at).try(:day) || -1
      if t.now.hour > updatehour && last_update < t.now.day# get prediction
        #This conditional is makins sure I am making sure I am updating at or slightly after the update hour and that the last update has happened yesterday or earlier
        today =  get_weather_from_lat_long(board.latitude,board.longitude)
        puts board.latitude
        puts board.longitude
        d = Dailyweatheractual.new
        d.apisource           = "forcast.io"
        d.zipcode             = board.zipcode
        d.maxtemp             = today['daily']['data'][0]['temperatureMax'].to_f.round
        d.mintemp             = today['daily']['data'][0]['temperatureMin'].to_f.round
        d.wind                = today['daily']['data'][0]['windSpeed'].to_f.round
        d.precipitation   = today['daily']['data'][0]['precipProbability'].to_i
        d.summary             = today['daily']['data'][0]['summary']
        if d.save
          puts d.inspect
          #cool
        else
          puts "could not save. =>\n#{d.errors.full_messages}"
        end
      end #if
    end
  end
end#namespace