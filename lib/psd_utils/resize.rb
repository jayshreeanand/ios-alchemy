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
        layer.image.save_as_png "output/#{layer.path}.png"
        # Image.create(onex: "/output/#{layer.path}.png")
        end
    end
  end
end

