class AddPaperclipToUploads < ActiveRecord::Migration
  def change
    add_attachment :uploads, :psd  
  end
end
