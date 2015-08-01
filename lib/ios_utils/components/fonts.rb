module IosUtils::Components
  class Fonts
    def self.generate data
      template data[:fonts]
    end

    def self.template fonts
      result = ''
      result += "<customFonts key='customFonts'>\n"
      fonts.each do |font|
        result += "<mutableArray key='#{font}'>\n"
        result +=   "<string>#{fo}</string>\n"
        result += "</mutableArray>\n"
      end
      result += "</customFonts>\n"
    end
  end
end