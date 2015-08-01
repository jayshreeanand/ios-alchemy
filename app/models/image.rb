class Image < ActiveRecord::Base
  belongs_to :designs, dependent: :destroy
  has_attached_file :onex, 
                  :storage => :s3,
                  :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  has_attached_file :twox, 
                :storage => :s3,
                :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
  has_attached_file :threex, 
                :storage => :s3,
                :s3_credentials => Proc.new{|a| a.instance.s3_credentials }
                  
  validates_attachment_file_name :onex, :matches => [/png\Z/]
  validates_attachment_file_name :twox, :matches => [/png\Z/]
  validates_attachment_file_name :threex, :matches => [/png\Z/]


def s3_credentials
  { 
    bucket: ENV['S3_BUCKET'], 
    access_key_id: ENV['AWS_ACCESS_KEY'],
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
  }
end

end
