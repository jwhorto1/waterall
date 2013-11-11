namespace :bardshorts do
  desc "update weather data on dailyweather models"
  #rake bardshorts:manipulate --trace
  task :manipulate => :environment do
    
    def set_shortmessage_from_triggers
      triggers  = Trigger.where(weekday_int: @weekint)
      triggers.each_with_index do |trigger,i|
        begin
          hour = trigger.start_time.hour >= Time.now.in_time_zone("#{trigger.channel.board.timezone}").hour#past or current hour
          minute = trigger.start_time.min <= Time.now.in_time_zone("#{trigger.channel.board.timezone}").min#past or current minute
          last_update = (trigger.channel.board.boardshortmessage.updated_at.in_time_zone("#{trigger.channel.board.timezone}") + 15.minutes) < Time.now.in_time_zone("#{trigger.channel.board.timezone}")# last update was more than 15m ago
          puts "#{hour}, #{minute}, #{last_update}"
          if hour && minute && last_update
             # => end if comparison, now BSM needs to be updated
             shortmessage = trigger.channel.board.boardshortmessage 
             shortmessage.public_send("channel#{trigger.channel.number}_on_in_seconds=", (trigger.duration * 10) )
             if shortmessage.save && Boardshortmessage.encode_4_board(shortmessage)
               #cool
               puts "saved short message #{shortmessage.inspect}"
             else
               puts "could not save/encode shortmessage\n\n\n\n\n"
             end
          end#if LONG LONG end
        rescue Exception => e
          puts "\n\n\n\nFailed at (#{$!}) with: #{e.backtrace.join("\n\t")}\n"
          next
        end
      end#trigger.each end

    end#end  set_shortmessage_from_triggers
    
    @weekint = Date::DAYNAMES[DateTime.now.wday.to_i]
    set_shortmessage_from_triggers
  end
end



# Boardshortmessage.all.each_with_index do |board, i|
#   set_short_from_triggers(board)
#   puts "Updated board schedule (#{i}) - #{board.name}"
# end