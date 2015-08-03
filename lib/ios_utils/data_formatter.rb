module IosUtils
  class DataFormatter
    def self.run design_id
      design  = Design.find(design_id)
      upload  = design.upload
      upload_id = upload.id
      upload.psd.copy_to_local_file(:original, Rails.root.join('tmp',"#{upload_id}.psd"))
      psd = PSD.new(Rails.root.join('tmp', "#{upload_id}.psd"))
      psd.parse!

      formatted_data = format_data.psd
      IosScreen.create!(design_id: design.id, formatted_data: formatted_data)

      IosUtils::Converter.run design_id
    end

    def self.format_data psd

    end

  end
end