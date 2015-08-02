class Design < ActiveRecord::Base
  serialize :meta_data
  belongs_to :upload
  has_many :images, dependent: :destroy
  enum status: [:incompleted, :completed]

  def extract
  end

end
