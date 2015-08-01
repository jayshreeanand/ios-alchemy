class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.references :upload, index:true
      t.text :meta_data
      t.timestamps
    end
  end
end
