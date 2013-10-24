class Dailyweather < ActiveRecord::Base
  validate :valid_zipcode
  validates_presence_of  :zipcode, :apisource, :mintemp, :maxtemp, :wind, :precipitation_actual, :precipitationprob
  
  def valid_zipcode
    state_city = Board.new.test_zipcode(zipcode)
    if state_city['city'] == nil
      errors.add(:zipcode, 'is not valid')
    end
  end
  
  
end
