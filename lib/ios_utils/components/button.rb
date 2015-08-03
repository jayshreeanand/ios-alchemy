module IosUtils::Components
  class Button
    def self.generate data
      template data
    end

    def self.template data
      type = "push" # regular button
      style = "rounded"
      data[:text] = data[:text] || "Button Name Here"
      if data[:type] = "rounded"
        type = "roundRect"
        style = "roundedRect"
      end
      result = ''
      result += "<button verticalHuggingPriority='750' fixedFrame='YES' translatesAutoresizingMaskIntoConstraints='NO' id='#{data[:id]}'>\n"
      result += "<rect key='frame' x='#{data[:left]}' y='#{data[:top]}' width='#{data[:width]}' height='#{data[:height]}'/>\n"
      result += "<buttonCell key='cell' type='#{type}' title='#{data[:text]}' bezelStyle='#{style}' imagePosition='overlaps' alignment='center' state='on' borderStyle='border' imageScaling='proportionallyDown' inset='2' id='#{data[:child_id]}'>\n"
      result +=   "<behavior key='behavior' pushIn='YES' lightByBackground='YES' lightByGray='YES'/>\n"
      result +=  "<font key='font' metaFont='controlContent'/>\n"
      result += "</buttonCell>\n"
      result +="</button>\n"
      result
    end
  end
end

# sample data {button: {left: 100, top: 100, width: 200, height: 200, id: "xs-sdf-ds", child_id: "xs-asd-sdf", text: "button texet here"}}
