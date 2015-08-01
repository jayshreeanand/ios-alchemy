module IosUtils::Components
  class TextField
    def self.generate data
      template data[:text_field]
    end

    def self.template data
    result  = ''
    result += "<textField horizontalHuggingPriority='251' verticalHuggingPriority='750' ambiguous='YES' translatesAutoresizingMaskIntoConstraints='NO' id='#{data[:id]}' userLabel='#{data[:name]}'>"
    result += "<rect key='frame' x='#{data[:left]}' y='#{data[:top]}' width='#{data[:width]}' height='#{data[:height]}'/>\n"
    result += "<textFieldCell key='cell' scrollable='YES' lineBreakMode='clipping' sendsActionOnEndEditing='YES' title='label text' id='EHo-mB-bcD'> \n"
    result += "<font key='font' metaFont='system'/> \n"
    result += "<color key='textColor' name='labelColor' catalog='System' colorSpace='catalog'/> \n"
    result += "<color key='backgroundColor' name='controlColor' catalog='System' colorSpace='catalog'/> \n"
    result += "</textFieldCell> \n"
    puts result
    end
  end
end

                    
