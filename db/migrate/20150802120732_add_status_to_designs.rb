class AddStatusToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :status, :integer, default: 0
  end
end
