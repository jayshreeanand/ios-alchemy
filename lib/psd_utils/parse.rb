  module PsdUtils
    class Parse
      def self.run upload_id
        upload = Upload.find upload_id
        upload.psd.copy_to_local_file(:original, Rails.root.join('tmp',"#{upload_id}.psd"))
        psd = PSD.new(Rails.root.join('tmp', "#{upload_id}.psd"))
        psd.parse!
        # traverse(psd)
        psd.image.save_as_png (Rails.root.join('tmp', "#{upload_id}_psd.png"))
        psd_image = MiniMagick::Image.open(Rails.root.join('tmp', "#{upload_id}_psd.png"))
        psd_image.resize "250x350"
        psd_image.write(Rails.root.join('tmp', "#{upload_id}_psd_resized.png"))
        resized_psd_image = File.open(Rails.root.join('tmp', "#{upload_id}_psd_resized.png"))
        meta_data = generate_meta_data upload.psd_file_name, psd
        upload.status = 1
        upload.psd_image = resized_psd_image
        upload.save!
        Design.create(meta_data: meta_data, upload_id: upload.id)
      end

      def self.generate_tree_data(node) 
        children_tree_at_node = []
        
        if node.has_children?
          node.children.each do |child_node|
            child_node_data = {
              name: child_node.name,
              id: child_node.layer_id.id
            }
            
            if child_node.group?  
              child_node_data[:children] = self.generate_tree_data(child_node)
              children_tree_at_node.push(child_node_data)
            elsif child_node.layer?
              children_tree_at_node.push(child_node_data)
            end
          end
        end

        return children_tree_at_node
      end

      def self.generate_meta_data file_name, psd
        
        psd_tree_data = self.generate_tree_data(psd.tree.root)
        return [
          label: file_name,
          id: 0,
          children: psd_tree_data
        ]
      end


=begin
        psd.layers.each_with_index do |layer, id|

          next if layer.hidden?
          if layer.folder?
            data = {}
            data[:label] = "Folder #{layer.name}"
            data[:id] = id
            parent = data
            parent[:children] = []
          elsif layer.folder_end?
             meta_data << parent.deep_dup
          else
            if parent.has_key? (:chidren)
              parent[:children] << {label: "Layer #{layer.name}", id: id}
              meta_data << {label: "Layer #{layer.name}", id: id}
            else
               meta_data << {label: "Layer #{layer.name}", id: id}
            end
          end
        end
        result = [{label: "File Name", id: 0, children: meta_data}]
=end

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

