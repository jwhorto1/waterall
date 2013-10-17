class Trigger < ActiveRecord::Base
  validates :duration, :numericality => { :greater_than => 0 }
  belongs_to :channel
  
  def to_formatted_watering(time)
    time.strftime("%H:%M")
  end
  
end
