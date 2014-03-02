namespace :bardshorts do
  desc "update weather data on dailyweather models"
  #rake bardshorts:manipulate --trace
  task :manipulate => :environment do
    #TODO: it might make sense to lock this boardmessage so if a board is requesting it, it does not notice teh changes before they are complete. The hardware board will need to check on a flag first likely.
    def set_shortmessage_from_triggers
      triggers  = Trigger.where(weekday_int: @weekint)
      triggers.each_with_index do |trigger,i|
        begin
          hour = trigger.start_time.hour == Time.now.in_time_zone(trigger.channel.board.timezone).hour#past or current hour
          minute = trigger.start_time.min <= Time.now.in_time_zone(trigger.channel.board.timezone).min#past or current minute
          last_update = (trigger.channel.board.boardshortmessage.updated_at.in_time_zone(trigger.channel.board.timezone)) < Time.now.in_time_zone(trigger.channel.board.timezone)# last update was more than 15m ago
          puts "(#{trigger.id}) #{hour}, #{minute}, #{last_update}:#{trigger.channel.board.boardshortmessage.updated_at.in_time_zone(trigger.channel.board.timezone)}:#{Time.now.in_time_zone(trigger.channel.board.timezone}"
          if hour && minute && last_update
            puts "----(#{trigger.id}) #{start_time}, #{duration}"
            
             # => end if comparison, now BSM needs to be updated
             shortmessage = trigger.channel.board.boardshortmessage 
             shortmessage.public_send("channel#{trigger.channel.number}_on_in_seconds=", (trigger.duration * 2) )
             shortmessage.date = DateTime.now.in_time_zone(trigger.channel.board.timezone)
             if shortmessage.save && Boardshortmessage.encode_4_board(shortmessage)
               puts "saved short message #{shortmessage.inspect}"
             else
               puts "could not save/encode shortmessage\n(#{shortmessage.id}) #{shortmessage.errors.messages}\n#{shortmessage.inspect}\n\n\n"
             end
          end#if LONG LONG end
        rescue Exception => e
          puts "\n\n\n\nFailed at (#{$!}) with: #{e.backtrace.join("\n\t")}\n"
          next
        end
      end#trigger.each end
    end#end  set_shortmessage_from_triggers
    @weekint = DateTime.now.wday.to_i
    set_shortmessage_from_triggers
  end
end



# Boardshortmessage.all.each_with_index do |board, i|
#   set_short_from_triggers(board)
#   puts "Updated board schedule (#{i}) - #{board.name}"
# end