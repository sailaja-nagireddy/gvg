by_xsd = false
  if by_xsd
  require 'nokogiri'

  xsd = Nokogiri::XML::Schema(File.open('v.xsd'))
  doc = Nokogiri::XML(File.read('example.xml'))
  xsd.validate(doc).each do |error|
    puts error.message
  end
end

by_libxml = true
if by_libxml
  require 'xml'

  dtd = XML::Dtd.new(File.read('v.dtd'))
  doc = XML::Document.string(File.read('example.vxml'))
  puts doc.validate(dtd)

  doc = LibXML::XML::Document.string('<foo bar="baz" />')
  dtd = LibXML::XML::Dtd.new('<!ELEMENT foo EMPTY><!ATTLIST foo bar ID #REQUIRED>')
  puts doc.validate dtd
  puts doc
end
