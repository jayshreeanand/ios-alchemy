class AddFieldsToUploads < ActiveRecord::Migration
  def change
    add_attachment :uploads, :psd_image
  end
end
