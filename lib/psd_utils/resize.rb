module PsdUtils
  class Resize
    def self.run upload_id
      upload = Upload.find upload_id
      upload.psd.copy_to_local_file(:original, Rails.root.join('tmp',"#{upload_id}.psd"))
      psd = PSD.new(Rails.root.join('tmp', '#{upload_id}.psd'))
      psd.parse!
      psd.tree.descendant_layers.each do |layer|
        path = layer.path.split('/')[0...-1].join('/')
        FileUtils.mkdir_p("output/#{path}")
        file_path = "output/#{layer.path}.png"
        layer.image.save_as_png file_path
        image = File.open file_path, 'r'
        test = S3Store.new(image).store
        # Image.create(onex: Rails.root.join("/output/test/#{layer.path.delete(' ')}.png"))
        end
    end
  end
end
  