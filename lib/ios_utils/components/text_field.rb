module IosUtils::Components
  class TextField
    def self.generate data
      template data
    end

    def self.template data

    data[:text] = data[:text] || ""
    data[:placeholder_text] = data[:placeholder_text] || "Label Text Here"
    result  = ''
    result += "<textField horizontalHuggingPriority='251' verticalHuggingPriority='750' ambiguous='YES' translatesAutoresizingMaskIntoConstraints='NO' id='#{data[:id]}' userLabel='#{data[:name]}'>"
    result += "<rect key='frame' x='#{data[:left]}' y='#{data[:top]}' width='#{data[:width]}' height='#{data[:height]}'/>\n"
    result += "<textFieldCell key='cell' scrollable='YES' lineBreakMode='clipping' sendsActionOnEndEditing='YES' title='#{data[:text]}' borderStyle='bezel' placeholderString='#{data[:placeholder_text]}'  drawsBackground='YES' id='#{data[:child_id]}'> \n"
    result += "<font key='font' metaFont='system'/> \n"
    result += "<color key='textColor' name='labelColor' catalog='System' colorSpace='catalog'/> \n"
    result += "<color key='backgroundColor' name='textBackgroundColor' catalog='System' colorSpace='catalog'/> \n"
    result += "</textFieldCell> \n"
    result += "</textField> \n"
    end
  end
end
