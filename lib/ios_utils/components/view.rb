module IosUtils::Components
  class View
    def self.generate data
      start_template data[:view]
      #generate other layer data here
      end_template data
    end

    def self.start_template data
      result  = ''
      result += "<?xml version='1.0' encoding='UTF-8' standalone='no'?>\n"
      result +=  "<document type='com.apple.InterfaceBuilder3.Cocoa.XIB' version='3.0' toolsVersion='7706' systemVersion='14D136' targetRuntime='MacOSX.Cocoa' propertyAccessControl='none' useAutolayout='YES' customObjectInstantitationMethod='direct'>\n"
      result +=    "<dependencies>\n"
      result +=          "<plugIn identifier='com.apple.InterfaceBuilder.CocoaPlugin' version='7706'/>\n"
      result +=      "</dependencies>\n"
      result +=      "<objects>\n"
      result +=          "<customObject id='-2' userLabel='Files Owner'/>\n"
      result +=          "<customObject id='-1' userLabel='First Responder' customClass='FirstResponder'/>\n"
      result +=          "<customObject id='-3' userLabel='Application' customClass='NSObject'/>\n"
      result +=   "<customView id='#{data[:id]}'>\n"
      result +=              "<rect key='frame' x='#{data[:left]}' y='#{data[:top]}' width='#{data[:width]}' height='#{data[:height]}'/>\n"
      result +=     "<autoresizingMask key='autoresizingMask' flexibleMaxX='YES' flexibleMinY='YES'/>\n"
      result +=     "<subviews>"
      result
    end

    def self.end_template data
      result = ''
      result +=     "</subviews>"
      result += "</customView>\n"
      result +=  "</objects>\n"
      result += "</document>\n"
      result
    end
  end
end