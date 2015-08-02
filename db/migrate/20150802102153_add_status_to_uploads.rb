class AddStatusToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :status, :integer, default: 0
  end
end
