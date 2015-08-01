module PsdUtils
  class Parse
    def self.run upload_id
      upload = Upload.find upload_id
      psd = upload.psd.copy_to_local_file(:original, "tmp/#{upload_id}.psd")
    end
  end
end

