 # config/initializers/paperclip.rb
 Paperclip::Attachment.default_options[:storage] = :s3
 Paperclip::Attachment.default_options[:bucket] = ENV['S3_BUCKET']
 Paperclip::Attachment.default_options[:s3_permissions] = :public_read
 Paperclip::Attachment.default_options[:s3_credentials] = {
   access_key_id: ENV['AWS_ACCESS_KEY'],
   secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
   bucket: ENV['S3_BUCKET']
 }