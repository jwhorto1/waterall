class Channel < ActiveRecord::Base
  belongs_to :board
  has_many :triggers
  validates :board_id, :presence => true
  
  mount_uploader :channel_image, ChannelUploader
  def arrayarize_based_on_day(triggers)
    #initialize day array
    days = [[]]
    7.times do |i|
      days[i] = []
    end
    # arrange triggers in respective days (day array used)
    triggers.each do |t|
      days[t.weekday_int] << t
    end
    7.times do |i|
      days[i].sort! { |a,b| b.start_time <=> a.start_time }
    end
    days
  end#def
  def pop_check(trigger)
    if trigger == nil
      Trigger.new
    else
      trigger
    end
  end#pop_check
  def find_longest_chain(aa)
    longest = 0
    aa.count.times do |i|
      longest = aa[i].count if aa[i].count > longest
    end
    longest
  end#find longest chain
end#channel class
