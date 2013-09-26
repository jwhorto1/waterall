=begin

ENV['USERNAME']              = ###########################################
ENV['PASSWORD']              = ###########################################
ENV['AWS_ACCESS_KEY_ID']     = ###########################################
ENV['AWS_SECRET_ACCESS_KEY'] = ###########################################
ENV['S3_BUCKET']             = ###########################################
ENV['CACHE_DIR']             = "#{Rails.root}/tmp/uploads"
ENV['APP_NAME']              = Rails.env.staging? ? 'wbox' : 'Waterall'

=end
