class AddDesignIdToUpload < ActiveRecord::Migration
  def change
    add_column :uploads, :design_id, :integer
  end
end
