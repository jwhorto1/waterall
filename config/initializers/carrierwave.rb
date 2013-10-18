CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',                         # required
    :aws_access_key_id      => "AKIAJQIK2X5MHANAEI3Q",      # required
    :aws_secret_access_key  => "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"   # required
    # :region                 => 'us-standard'                 # optional, defaults to 'us-east-1'
    #:host                   => 's3.example.com',             # optional, defaults to nil
    #:endpoint               => 'https://s3.example.com:8080' # optional, defaults to nil
  }
  config.fog_directory  = 'waterall'                     # required
  # config.fog_public     = false                                   # optional, defaults to true
  # config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  # config.permissions = 0666
  config.cache_dir = ENV['CACHE_DIR']
end