require 'nokogiri'

file_to_be_validated = 'testb_dtd.vxml'

method1 = true
if method1
  vxml = File.read(file_to_be_validated)
  options = Nokogiri::XML::ParseOptions::DTDLOAD
  doc = Nokogiri::XML::Document.parse(vxml, nil, nil, options)
  puts doc
  puts doc.external_subset.validate(doc)
end

vxml_dtd_file = '../resources/voicexml21/schema/vxml.dtd'

method2 = false
if method2
  dtd = Nokogiri::XML::DTD.new(
    'vxml',
    Nokogiri::XML::Document.parse(
      File.read(vxml_dtd_file)
    )
  )
  doc = Nokogiri::XML(open(file_to_be_validated))
  puts dtd.validate(doc)
end

method3 = false
if method3
  dtd = Nokogiri::XML::DTD.new(
    'vxml',
    Nokogiri::XML::Document.parse(
      File.read(vxml_dtd_file)
    )
  )
  options = Nokogiri::XML::ParseOptions::DTDVALID
  doc = Nokogiri::XML::Document.parse(
    File.read(file_to_be_validated), nil, nil, options
  )
  puts dtd.validate(doc)
end

