class Channel < ActiveRecord::Base
  belongs_to :board
  #has_many :triggers
  mount_uploader :channel_image, ChannelUploader
end
