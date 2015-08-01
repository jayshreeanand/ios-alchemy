module PsdUtils
  class Resize
    def self.run upload_id
      upload = Upload.find upload_id
      upload.psd.copy_to_local_file(:original, Rails.root.join('tmp',"#{upload_id}.psd"))
      psd = PSD.new(Rails.root.join('tmp', "#{upload_id}.psd"))
      psd.parse!
      psd.tree.descendant_layers.each do |layer|
        path = layer.path.split('/')[0...-1].join('/')
        FileUtils.mkdir_p("output/#{path.delete(' ')}")
        @file_path = "output/#{layer.path.delete(' ')}"
        image = layer.image.save_as_png "#{@file_path}.png"
        image_1x = resize_1x.write "#{@file_path}_1x.png"
        image_2x = resize_2x.write "#{@file_path}_2x.png"
        image_3x = resize_3x.write "#{@file_path}_3x.png"

        Image.create(onex: image_1x, twox: image_2x, threex: image_3x)
      end
    end

    def self.resize_1x
      image = MiniMagick::Image.open "#{@file_path}.png"
      image.resize "#{image.width/3}x#{image.height/3}"
    end

    def self.resize_2x
      image = MiniMagick::Image.open "#{@file_path}.png"
      image.resize "#{image.width/2}x#{image.height/2}"
    end

    def self.resize_3x
      image = MiniMagick::Image.open "#{@file_path}.png"
    end
  end
end