class IosScreen < ActiveRecord::Base
  serialize :formatted_data
  belongs_to :design
end
