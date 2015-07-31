S3DirectUpload.config do |c|
  c.access_key_id = ENV['AWS_ACCESS_KEY']
  c.secret_access_key = ENV['AWS_SECRET_ACCESS_KEY']
  c.bucket = ENV['S3_BUCKET']              
  c.region = nil            
  c.url = nil             
end