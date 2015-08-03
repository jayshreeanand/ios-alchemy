module IosUtils::Components
  class Constraints
    def self.generate data
      template data[:constraints]
    end

    def template data
      result = ''

      for data.each do |constraint|
        #TODO
      end
    end
  end
end

