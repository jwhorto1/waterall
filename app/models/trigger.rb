class Trigger < ActiveRecord::Base
  validates :duration, :numericality => { :greater_than => 0 }
  belongs_to :channel
  validates :channel_id, :start_time, :weekday_int, :presence => true
  def to_formatted_watering(time)
    time.strftime("%H:%M")
  end
  
  def board_channels(boards)
    bm = Board.new
    boards.each do |b|
      bm.channels << b.channels.load
    end#end each
    bm.channels.collect {|c| [ "#{c.board.name}:#{c.name}", c.id ] }
  end#end board_channels(boards)
  
end
