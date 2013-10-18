class Board < ActiveRecord::Base
  belongs_to :person
  has_many :channels
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  def self.initialize_dependencies(board)
    8.times do |n|
      puts "creating #{n.ordinalize} board channel"
      c = Channel.new
      c.board_id = board.id
      c.number   = n + 1
      c.name     = "#{(n+1).ordinalize} channel"
      if c.save
        puts "saved #{n.ordinalize} channel"
        Board.create_day_and_triggers(c)
      else
        raise
        puts "COULD NOT save #{n.ordinalize} channel"
        puts c.errors.full_messages
      end#if
      
    end#.times
  end#self.initialize_dependencies
  def self.create_day_and_triggers(channel)
    #http://stackoverflow.com/questions/4044574/how-calculate-the-day-of-the-week-of-a-date-in-ruby
    7.times do |x|
       t                = Trigger.new
       t.channel_id     = channel.id
       t.weekday_id     = 0
       t.start_time          = Time.zone.local(Time.now.year,Time.now.month,Time.now.day,0,0)
       t.duration       = 20#minutes #TODO: would be nice to have a configuration for default times etc on channels
       t.weekday_int    = x
       t.weekday_string = Date::DAYNAMES[x]
       if t.save
         #Greeeat!
         t2 = t.dup
         t2.start_time += 11.hours
         t2.save
       else
         puts "could not save Trigger"
         puts t.errors.full_messages
       end
    end
  end#create_day_and_triggers
end#class
