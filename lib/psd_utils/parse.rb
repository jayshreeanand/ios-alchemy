module PsdUtils
  class Parse
    def self.run upload_id
      upload = Upload.find upload_id
      # upload.psd.copy_to_local_file(:original, Rails.root.join('tmp',"#{upload_id}.psd"))
      psd = PSD.new(Rails.root.join('tmp', "#{upload_id}.psd"))
      psd.parse!
      traverse(psd)
      meta_data = psd.tree.to_hash
      upload.designs.create!(meta_data: meta_data)
    end

    def self.traverse psd
      if psd.resources[:layer_comps]
        puts "\nLayer Comps:\n===================="
        puts psd.resources[:layer_comps].data.names
      end

      puts "\nVisible Layers:\n===================="
      psd.layers.each do |layer|
        # next if layer.folder? || layer.hidden? || layer.folder_end?
        next if layer.hidden?

        if layer.folder?
          puts "Folder #{layer.name}"
        elsif layer.folder_end?
          puts "Layer ends here"
        else

          puts "Name: #{layer.name}"
          puts "Position: top = #{layer.top}, left = #{layer.left}"
          puts "Size: width = #{layer.width}, height = #{layer.height}"
          puts "Mask: width = #{layer.mask.width}, height = #{layer.mask.height}"
          puts "Reference point: #{layer.reference_point.x}, #{layer.reference_point.y}"

          puts ""
        end
      end

      puts "\nPSD Info:\n===================="
      puts "#{psd.width}x#{psd.height} #{psd.header.mode_name}"
      puts "#{psd.resources.data.size} resources parsed"
      puts "#{psd.layers.size} layers, #{psd.folders.size} folders"

    end
  end
end

