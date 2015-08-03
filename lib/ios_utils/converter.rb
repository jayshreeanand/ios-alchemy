module IosUtils
  class Converter
    def self.run design_id
      design  = Design.find(design_id)
      upload  = design.upload
      upload_id = upload.id
      upload.psd.copy_to_local_file(:original, Rails.root.join('tmp',"#{upload_id}.psd"))
      psd = PSD.new(Rails.root.join('tmp', "#{upload_id}.psd"))
      psd.parse!
      data = []
      i = 0
      psd.tree.descendant_layers.each do |child|
        next if child.hidden?
        next if child.folder?
        layer_name = child.name.downcase.delete(' ')
        child_data = { id: rand.to_s[2..11],
                       child_id: rand.to_s[2..11], 
                       name: layer_name,
                       top: child.top,
                       bottom: child.bottom,
                       left: child.left,
                       right: child.right,
                       width: child.width,
                       height: child.height,
                       mask_width: child.mask.width,
                       mask_height: child.mask.height,
                       reference_x: child.reference_point.x,
                       reference_y: child.reference_point.y
                      }
        if layer_name.starts_with? "label_"
          child_data[:type] = "label"
          child_data[:text] = child.text[:value]
          child_data[:text_properties] = {}
          child_data[:text_properties][:value] = child.text[:value]
          child_data[:text_properties][:font] = child.text[:font][:name]
          child_data[:text_properties][:sizes] = child.text[:font][:sizes]
          child_data[:text_properties][:colors] = child.text[:font][:colors]
        elsif layer_name.starts_with? "button_"
          child_data[:type] = "button"
        elsif layer_name.starts_with? "image_"
          child_data[:type] = "image"
        elsif layer_name.starts_with? "icon_"
          child_data[:type] = "icon"
        elsif layer_name.starts_with? "table_view_cell_"
          child_data[:type] = "table_view_cell"
        elsif layer_name.starts_with? "navigation_bar"
          child_data[:type] = "navigation_bar"
        elsif layer_name.starts_with? "progress_bar"
          child_data[:type] = "progress_bar"
        end

        data << child_data
      end
      

        result = generate_template data
        ios_screen = IosScreen.first_or_create(design_id: design.id)
        ios_screen.formatted_data = result
        ios_screen.save!
        
        # IosScreen.create!(design_id: design.id, formatted_data: result)

    end

    def self.generate_template data
      view_data = {type: "view", id: rand.to_s[2..11], left: '0', top: '0', width: '320', height: '400'} # default view boundaries
      result = ''
      result += IosUtils::Components::View.start_template view_data

      data.each do |component_data|

        if component_data[:type] == "label"
          result += IosUtils::Components::TextField.generate component_data
        elsif component_data[:type] == "button"
          result +=  IosUtils::Components::Button.generate component_data
        elsif component_data[:type] == "progress_bar"
          result += IosUtils::Components::ProgressBar.generate component_data
        elsif component_data[:type] == "image"
          result += IosUtils::Components::ImageView.generate component_data

        elsif component_data[:type] == "navigation_bar"
          #TODO
        elsif component_data[:type] == "table_view_cell"
          #TODO
        elsif component_data[:type] == "fonts"  
          result += IosUtils::Components::Fonts.generate component_data 
        end
      end

      result += IosUtils::Components::View.end_template view_data
      result
    end
  end
end
