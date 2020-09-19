require 'json'
require 'xml'

class Gvg::Processor
  def self.parse(filename)
    return JSON.parse(File.read(filename))
  end

  def self.validate(filename, dtd_path)
    dtd = XML::Dtd.new(File.read(dtd_path))
    doc = XML::Document.string(File.read(filename))
    return doc.validate(dtd)
  end
end

