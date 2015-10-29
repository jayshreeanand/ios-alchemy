module PsdUtils
  class Resize
    def self.run design_id
      design = Design.find(design_id)
      upload = design.upload
      upload_id = upload.id
      upload.psd.copy_to_local_file(:original, Rails.root.join('tmp',"#{upload_id}.psd"))
      psd = PSD.new(Rails.root.join('tmp', "#{upload_id}.psd"))
      psd.parse!
      psd.tree.descendant_layers.each do |layer|
        path = layer.path.split('/')[0...-1].join('/')
        FileUtils.mkdir_p("output/#{path.delete(' ')}")
        @file_path = "output/#{layer.path.delete(' ')}"
        image = layer.image.save_as_png "#{@file_path}.png"
        resize_1x
        resize_2x
        resize_3x

        image_1x = File.open("#{@file_path}_1x.png")
        image_2x = File.open("#{@file_path}_2x.png")
        image_3x = File.open("#{@file_path}_3x.png")


        Image.create(design_id: design.id, onex: image_1x, twox: image_2x, threex: image_3x)
        design.status = 1
        design.save!
        FileUtils.rm_rf("output/")
      end
    end

    def self.resize_1x
      image = MiniMagick::Image.open "#{@file_path}.png"
      image.resize "#{image.width/3}x#{image.height/3}"
      image.write "#{@file_path}.png"
    end

    def self.resize_2x
      image = MiniMagick::Image.open "#{@file_path}.png"
      image.resize "#{(image.width*2)/3}x#{(image.height*2)/3}"
      image.write "#{@file_path}_2x.png"
    end

    def self.resize_3x
      image = MiniMagick::Image.open "#{@file_path}.png"
      image.write "#{@file_path}_3x.png"
    end
  end
end