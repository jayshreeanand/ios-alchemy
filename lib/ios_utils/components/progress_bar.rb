module IosUtils::Components
  class ProgressBar
    def self.generate data
      template data[:progress_bar]
    end

    def self.template fonts
      result = ''
      result += "<progressIndicator fixedFrame='YES' maxValue='100' indeterminate='YES' style='bar' translatesAutoresizingMaskIntoConstraints='NO' id='#{data[:id]}'>\n"
      result += "<rect key='frame' x='#{data[:left]}' y='#{data[:top]}' width='#{data[:width]}' height='#{data[:height]}'/>\n"
      result += "</progressIndicator>\n"
    end
  end
end




  
