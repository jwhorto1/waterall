class Waterallboard < ActiveRecord::Base
  belongs_to :person
  geocode_by :address
  after_validation :geocode, :if => :address_changed?
end
