require 'nokogiri'

xsd = Nokogiri::XML::Schema(File.open('v.xsd'))
doc = Nokogiri::XML(File.read('example.xml'))
xsd.validate(doc).each do |error|
  puts error.message
end
