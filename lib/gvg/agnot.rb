require 'aasm'
require 'nokogiri'

def audio(audio)
  parent = @builder.doc.at('vxml')
  builder = Nokogiri::XML::Builder.with(parent) do |xml|
    xml.form do
      xml.block do
        xml.prompt do
          xml.audio(src: audio['source']) do
            xml.text(audio['text'])
          end
        end
      end
    end
  end

  return builder.to_xml
end

def open
  @builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|
    xml.vxml(version: 2.0)
  end
end

def close(filename)
  File.write(filename, @builder.to_xml)
end

class Gvg::Agnot
  include AASM

  aasm whiny_transitions: false do
    state :waiting, initial: true
    state :saying, :listening, :working
    state :done

    event :start do
      transitions to: :waiting, after: Proc.new {|*args| open(*args)}
    end

    event :stop do
      transitions to: :done, after: Proc.new {|*args| close(*args)}
    end

    event :say do
      transitions from: :waiting, to: :saying, after: Proc.new {|*args| audio(*args)}
      transitions from: :listening, to: :saying, after: Proc.new {|*args| audio(*args)}
      transitions from: :saying, to: :saying, after: Proc.new {|*args| audio(*args)}
    end

    event :listen do
      transitions from: :saying, to: :listening
    end

    event :work do
      transitions from: :listening, to: :working
    end

    event :wait do
      transitions from: [:saying, :listening, :working], to: :waiting
    end
  end
end

