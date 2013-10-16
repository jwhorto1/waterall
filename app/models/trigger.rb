class Trigger < ActiveRecord::Base
  belongs_to :channel
  def to_formatted_watering(time)
    time.strftime("%H:%M")
  end
end
