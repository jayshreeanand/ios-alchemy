#  lib/s3_store.rb
class S3Store
  BUCKET = ENV['S3_BUCKET'].freeze

  def initialize file
    @file = file
    @s3 = AWS::S3.new
    @bucket = @s3.buckets[BUCKET]
  end

  def store
    @obj = @bucket.objects[filename].write(@file, acl: :public_read)
    self
  end

  def url
    @obj.public_url.to_s
  end

  private

  def filename
    @filename ||= @file.path.gsub(/[^a-zA-Z0-9_\.]/, '_')
  end
end