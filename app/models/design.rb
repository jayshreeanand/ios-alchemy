class Design < ActiveRecord::Base
  serialize :meta_data
  belongs_to :upload
  has_many :images, dependent: :destroy

  def extract
  end

end
