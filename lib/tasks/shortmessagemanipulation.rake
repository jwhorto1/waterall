namespace :bardshorts do
  desc "update weather data on dailyweather models"
  #rake bardshorts:manipulate --trace
  task :manipulate => :environment do
    @weekint = Date::DAYNAMES[DateTime.now.day.to_i]
    set_shortmessage_from_triggers
    
    
    
    Boardshortmessage.all.each_with_index do |board, i|
      set_short_from_triggers(board)
      puts "Updated board schedule (#{i}) - #{board.name}"
    end
    
    if @boardshortmessage.save && Boardshortmessage.encode_4_board(@boardshortmessage)
    end
    
    def set_shortmessage_from_triggers
      #TODO: MultiBoard: right now it only sort of default for one board
      triggers  = Trigger.where(weekday_int: @weekint)
      triggers.each_with_index do |trigger|
        channel = trigger.channel
        bid = trigger.channel.board_id
        if trigger 
        end
      end
    end
  end
end
