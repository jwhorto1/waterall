class Boardshortmessage < ActiveRecord::Base
  validates :date, :presence => true#,
                                 #:if   => :date_is_correct?
  belongs_to :board
  validates_inclusion_of :channel1_on_in_seconds,
    :channel2_on_in_seconds,
    :channel3_on_in_seconds,
    :channel4_on_in_seconds,
    :channel5_on_in_seconds,
    :channel6_on_in_seconds,
    :channel7_on_in_seconds,
    :channel8_on_in_seconds, :in => (0..99).collect{|i| i.to_i} + (0..99).collect{|i| i.to_s}
  after_save :addlast_updated_stamp
  validates_presence_of :board_id  
  def date_is_correct?
    if date < now
      errors.add(:date, 'is invalid.')
      false
    else
      true
    end
  end
  
  def self.encode_4_board(boardsm)
    #ascii conversion on the channels
    (1..8).each do |n|
      boardsm.public_send("channel#{n}=", boardsm.to_ascii(boardsm.read_attribute("channel#{n}_on_in_seconds")))
    end
    #Conversion on other fields
      #date conversion
    boardsm.date_conversion(boardsm)
      #ascii conversion
      #TODO: convert the other fields if necessary and add to concatnate string as needed.
    #send to Concatinated board ascii
    boardsm.concatenate(boardsm)
    if boardsm.save
      return true
    else
      puts "ERROR:cannot encode"
      return false
    end
  end  
  
  def to_ascii(number)
    if number.to_s.size < 2
      #recusively ajust the number buffer
     number = Boardshortmessage.new.add_leading(number)
    end
    ascii_converted = ""
    "#{number}".each_byte do |c|
       ascii_converted += c.to_s
    end
    ascii_converted
  end
  def add_leading(number)
    if "0#{number}".size == 2
      "0#{number}"
    elsif "0#{number}".size < 2
      add_leading("0#{number}")
    else
      "00"
    end
      
    
  end
  def date_conversion(boardsm)
    dates = ["year", "month", "day", "hour", "minute", "second"]
    dates.each do |n|
      boardsm.public_send("#{n}=", boardsm.to_ascii(boardsm.read_attribute("date").to_datetime.send("#{n}")))
      if n == "year"#needs s special handling
        boardsm.public_send("#{n}=", boardsm.to_ascii(boardsm.read_attribute("date").to_datetime.strftime("%y")))
      end
    end
  end
  def concatenate(boardsm)
    concat = ""
    #add channel configuration
    (1..8).each do |n|
      num = boardsm.read_attribute("channel#{n}_on_in_seconds").to_s
      if num.to_s.size < 2
        #ajust the number buffer
       num = Boardshortmessage.new.add_leading(num)
      end
      concat << num
    end
    #add date configuration
    dates = ["year", "month", "day", "hour", "minute", "second"]
    dates.each do |n|
      if n == "year"#needs s special handling
        concat << boardsm.read_attribute("date").to_datetime.strftime("%y").to_s
      else
        num = boardsm.read_attribute("date").to_datetime.send("#{n}").to_s
        if num.to_s.size < 2
          #ajust the number buffer
         num = Boardshortmessage.new.add_leading(num)
        end
        concat << num
      end 
    end
    boardsm.concatinated_board_ascii = concat
    #add others as needed
    #TODO
    #compound photonics
  end
  def self.update_master_sm(trigger)
    # when we get here we already know the SM needs to be updated
    begin
      n = trigger.channel.number <= 8 ? trigger.channel.number : 8 
      sm = Boardshortmessage.find_or_initialize_by(id: "#{trigger.channel.board.boardshortmessage_id}")
      sm.public_send("channel#{n}_on_in_seconds=", trigger.duration * ENV['BOARDSM_MULTIPLIER'].to_i)
      sm.save
    rescue Exception => e
      puts sm.public_send("channel#{n}_on_in_seconds")
      puts e
    end
  end
  def check_for_hot_trigger(trigger)
    hour = trigger.start_time.hour == Time.now.in_time_zone(trigger.channel.board.timezone).hour#past or current hour
    minute = trigger.start_time.min/ENV['BOARDSM_UPDATE_FREQUENCY'].to_i == (Time.now.in_time_zone(trigger.channel.board.timezone).min/ENV['BOARDSM_UPDATE_FREQUENCY'].to_i)
    if hour && minute
      self.public_send("channel#{trigger.channel.number}_on_in_seconds=", trigger.duration * ENV['BOARDSM_MULTIPLIER'].to_i)    
    end
  end
  def update_board_schedule
    8.times do |i|
      self.public_send("channel#{i+1}_on_in_seconds=", 0 )
    end
    @weekint = DateTime.now.in_time_zone("Arizona").wday.to_i 
    board = self.board
    
    board.channels.each do |channel|
      channel.triggers.where(weekday_int: @weekint).each do |trigger|
        #check for trigger that is supposed to be up now
        self.check_for_hot_trigger(trigger)
      end
    end
    self.save    
  end
  
  private
    def addlast_updated_stamp
      if self.concatinated_board_ascii.include? "#{self.updated_at.to_i}"
        #already updated
      else
        new_cat = "#{self.concatinated_board_ascii}T#{self.updated_at.to_i}"
        self.update_attributes :concatinated_board_ascii => new_cat
      end
    end
end
