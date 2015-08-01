module PsdUtils
  class Parse
    def self.run upload_id
      upload = Upload.find upload_id
      upload.psd.copy_to_local_file(:original, Rails.root.join('tmp',"#{upload_id}.psd"))
      psd = PSD.new(Rails.root.join('tmp', '#{upload_id}.psd'))
      psd.parse!
      meta_data = psd.tree.to_hash
      upload.designs.create!(meta_data: meta_data)
    end
  end
end

