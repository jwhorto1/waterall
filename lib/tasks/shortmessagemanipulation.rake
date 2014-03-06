namespace :boardshortmessage do
  desc "update weather data on dailyweather models"
  #rake boardshortmessage:manipulate --trace
  task :manipulate => :environment do
    #TODO: it might make sense to lock this boardmessage so if a board is requesting it, it does not notice teh changes before they are complete. The hardware board will need to check on a flag first likely.
    def zero_out_boardshortmessage(shortmessage)
      #TODO: this so will NOT scale.
      8.times do |i|
        shortmessage.public_send("channel#{i+1}_on_in_seconds=", 0 )
      end
    end
    def compare_bsm(bsm)
      #
    end
    def save_short_message(shortmessage)
      puts shortmessage.inspect
      puts "\n\n\nGOGOGO========#{shortmessage != Boardshortmessage.find(shortmessage.id)}\n\n\n"
      if shortmessage.id != nil
        shortmessage.date = DateTime.now.in_time_zone(shortmessage.board.timezone)
        if shortmessage.save && Boardshortmessage.encode_4_board(shortmessage)
          puts "=)----------------Saved short message #{shortmessage.inspect}\n\n\n"
        else
          puts "=(----------------Not saved/encoded shortmessage: (#{shortmessage.id}) #{shortmessage.errors.messages}\n#{shortmessage.inspect}\n\n\n"
        end
      else
        puts "Does not need to save as there are no triggers here"
      end
    end
    
    def sort_into_buckets(triggers)
      boardsmbuckets = triggers.group_by { |obj| obj.channel.try(:board).try(:boardshortmessage_id) }.values
      boardsmbuckets
    end
    def set_shortmessage_from_triggers
      triggers  = Trigger.where(weekday_int: @weekint)
      boardsmbuckets = sort_into_buckets(triggers)
      boardsmbuckets.each_with_index do |bucket,i|
        @shortmessage = bucket.first.channel.board.boardshortmessage 
        next if @shortmessage == nil
        zero_out_boardshortmessage(@shortmessage)
        bucket.each_with_index do |trigger,i|
          begin
            hour = trigger.start_time.hour == Time.now.in_time_zone(trigger.channel.board.timezone).hour#past or current hour
            #This is very important: To make sure the task run at 4:10 does not trigger the 4:30 watering I basically mod to make sure they are the same.
            minute = trigger.start_time.min/ENV['BOARDSM_UPDATE_FREQUENCY'].to_i == (Time.now.in_time_zone(trigger.channel.board.timezone).min/ENV['BOARDSM_UPDATE_FREQUENCY'].to_i)
            last_update = @shortmessage.updated_at < Time.now.in_time_zone(@shortmessage.updated_at.time.zone) - ENV['BOARDSM_LAST_UPDATE'].to_i.minute# last update was more than ENV['BOARDSM_LAST_UPDATE'] min ago (2 as of this writing)
            trigger_updated = trigger.updated_at > @shortmessage.updated_at
            puts "----------------(#{trigger.id})(all) #{hour}, #{minute}, #{last_update}, #{trigger_updated}"
            if hour && minute && last_update && trigger_updated
              puts "----------------(#{trigger.id}) #{trigger.start_time}, #{trigger.duration}"
               #if comparison, now BSM needs to be updated
               @shortmessage.public_send("channel#{trigger.channel.number}_on_in_seconds=", (trigger.duration * ENV['BOARDSM_MULTIPLIER'].to_i) )
            end#if LONG LONG end
          rescue Exception => e
            puts "\n\n\n\n----------------Failed at (#{$!}) with: #{e.backtrace.join("\n\t")}\n"
            next
          end#begin end          
        end#bucket each end  
        if @shortmessage && @shortmessage.id != nil
          save_short_message(@shortmessage)
        end
            
      end#boardsmbuckets.each end
    end#end  set_shortmessage_from_triggers
    @weekint = DateTime.now.in_time_zone("Arizona").wday.to_i 
    set_shortmessage_from_triggers
  end
  #rake boardshortmessage:test_update_job --trace
  task :test_update_job => :environment do
    #Board.update_all(:timezone => 'Arizona')
    Trigger.update_all(:duration => ENV['DEFAULT_TRIGGER_DURATION'])
    # jack = Board.find(6)
    # jack.boardshortmessage_id = 2
    # jack.save
    # 
    # jack = Board.find(9)
    # jack.boardshortmessage_id = 3
    # jack.save
    # 
    # jack = Board.find(5)
    # jack.boardshortmessage_id = 4
    # jack.save
    
    
  end
end



# Boardshortmessage.all.each_with_index do |board, i|
#   set_short_from_triggers(board)
#   puts "Updated board schedule (#{i}) - #{board.name}"
# end