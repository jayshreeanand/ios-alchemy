class CreateIosScreens < ActiveRecord::Migration
  def change
    create_table :ios_screens do |t|
      t.references :design, index: true
      t.text :formatted_data
      t.timestamps
    end
  end
end
