class Boardshortmessage < ActiveRecord::Base
  validates :date, :presence => true,
                                 :unless   => :date_is_correct?
  def date_is_correct?
    puts "#{self.read_attribute("date")}\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    if self.date < DateTime.now
      errors.add(:date, 'is invalid. Cannot be in the past')
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
    "0#{number}"
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
      puts num
      puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
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
end
