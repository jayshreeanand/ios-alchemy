module IosUtils::Components
  class ImageView
    def self.generate data
      template data[:image_view]
    end

    def template data
      result = ''
      result += "<imageView horizontalHuggingPriority='251' verticalHuggingPriority='251' fixedFrame='YES' translatesAutoresizingMaskIntoConstraints='NO' id='data[:id]'>\n"
      result += "<rect key='frame' x='#{data[:left]}' y='#{data[:top]}' width='48' height='48'/>\n"
      result += "<imageCell key='cell' refusesFirstResponder='YES' alignment='left' imageScaling='proportionallyDown' id='V7p-Hp-c5D'/>\n"
      result += "</imageView>\n"
      
    end
  end
end





















