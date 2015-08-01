class Image < ActiveRecord::Base
  belongs_to :designs, dependent: :destroy
  has_attached_file :onex, 
                  :storage => :s3,
                  :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
                  
  validates_attachment_file_name :psd, :matches => [/psd\Z/]

def s3_credentials
  { 
    bucket: ENV['S3_BUCKET'], 
    access_key_id: ENV['AWS_ACCESS_KEY'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
  }
end

end
