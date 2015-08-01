class Upload < ActiveRecord::Base

has_attached_file :psd, 
                  :storage => :s3,
                  :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
                  
validates_attachment_file_name :psd, :matches => [/psd\Z/]
belongs_to :user
has_many :designs

def s3_credentials
  { 
    bucket: ENV['S3_BUCKET'], 
    access_key_id: ENV['AWS_ACCESS_KEY'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
  }
end

end
