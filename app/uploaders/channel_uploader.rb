# encoding: utf-8
require 'carrierwave/processing/mime_types'
class ChannelUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  include CarrierWave::RMagick
  include CarrierWave::MimeTypes
  process :set_content_type
  # include CarrierWave::MiniMagick
  # Choose what kind of storage to use for this uploader:
  #storage :file
  storage :fog
  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
     begin
       "#{Rails.env}/#{model.board.person.id}-#{model.board.person.first_name.gsub(/[^0-9a-z]/i, '')}-#{model.board.person.last_name.gsub(/[^0-9a-z]/i, '')}/#{model.board.name.gsub(/[^0-9a-z]/i, '')}"
     rescue
      "#{Rails.env}/orphan-uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
     end
  end
  version :thumb do
    process :resize_to_fill => [256, 200]
    # process :resize_to_limit => [256, 200]    
  end
  version :rec do
    process :resize_to_fill => [64, 100]
  end
  def default_url
    ActionController::Base.helpers.asset_path("boardWiFi.jpg")
  end
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process :scale => [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process :scale => [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  def extension_white_list
    %w(jpg jpeg gif png TIFF BMP)
  end
  # def default_url
  #   "/assets/boardWiFi.jpg"
  #   #ActionController::Base.helpers.asset_path("fallback/" +  "boardWiFi.jpg")
  #   #"/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end
  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
