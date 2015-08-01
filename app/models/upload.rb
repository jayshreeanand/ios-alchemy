class Upload < ActiveRecord::Base

has_attached_file :psd
validates_attachment_file_name :psd, :matches => [/psd\Z/]
belongs_to :user
has_many :designs

end
