class Channel < ActiveRecord::Base
  belongs_to :board
  has_many :triggers
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
    days
  end#def
  def pop_check(trigger)
    if trigger == nil
      Trigger.new
    else
      trigger
    end
  end
end#channel class
