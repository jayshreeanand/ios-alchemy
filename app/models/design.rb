class Design < ActiveRecord::Base
  serialize :meta_data
  belongs_to :upload
  has_many :images, dependent: :destroy
  has_many :ios_screens, dependent: :destroy
  enum status: [:incompleted, :completed]

  def extract
  end

end

