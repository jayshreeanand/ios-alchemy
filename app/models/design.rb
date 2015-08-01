class Design < ActiveRecord::Base
  serialize :meta_data
  belongs_to :upload

end
