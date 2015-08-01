class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :design, index: true
      t.has_attached_file :onex
      t.has_attached_file :twox
      t.has_attached_file :threex
      t.timestamps
    end
  end
end
