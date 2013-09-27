class Waterallboard < ActiveRecord::Base
  extend ::Geocoder::Model::ActiveRecord
  belongs_to :person
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
