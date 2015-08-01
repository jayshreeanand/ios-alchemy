module IosUtils
  class Converter
    def self.run upload_id
      psd = PSD.new('tmp/4.psd')
      psd.parse!
      signin_screen = psd.tree.children_at_path('Signin').first # group
      data = []
      i = 0
      signin_screen.chidren.each do |child|
        layer_name = child.name.downcase.delete(' ')
        child_data = { id: ++i,
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
          child_data[:text] = {}
          child_data[:text][:value] = child.text[:value]
          child_data[:text][:font] = child.text[:font][:name]
          child_data[:text][:sizes] = child.text[:font][:sizes]
          child_data[:text][:colors] = child.text[:font][:colors]
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
        end

        generate_template data
      end
    end

  end
end
