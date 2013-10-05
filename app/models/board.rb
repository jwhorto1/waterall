class Board < ActiveRecord::Base
  belongs_to :person
  has_many :channels
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
end
