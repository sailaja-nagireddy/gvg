require 'gvg'
require 'thor'

class Gvg::Cli < Thor
  class_option :verbose, :type => :boolean, :aliases => "-v"

  desc "generate OPTIONS", "Generates VoiceXML from a given source file."
  method_option :source, :aliases => "-s", :desc => "Specify the input file path."
  method_option :source_format, :desc => "Specify the source format. (Default: JSON)"
  method_option :destination, :aliases => "-d", :desc => "Specify the output file path."
  method_option :destination_format, :desc => "Specify the destination format. (Default: VoiceXML 2.0)"
  def generate
    path_to_resources = Gvg::Helper.get_resource_dir
    defaults = {
      source: File.join(path_to_resources, 'hello.json'),
      destination: '/tmp/hello.vxml'
    }
    notfound = File.join(path_to_resources, '404.json')

    source = options[:source] || defaults[:source]
    source = File.file?(source) ? source : notfound

    destination = options[:destination] || defaults[:destination]

    automaton = Gvg::Processor.parse(source)

    agnot = Gvg::Agnot.new
    agnot.start
    states = automaton['states']
    for state in states
      agnot.send(state['type'], state['audio'])
    end
    agnot.stop(destination)
  end

  desc "validate OPTIONS", "Validates VoiceXML from a given source file."
  method_option :source, :aliases => "-s", :desc => "Specify the input file path. (Default: JSON)"
  method_option :source_format, :desc => "Specify the source format."
  def validate
    vxml_file_path = options[:source] || '/tmp/hello.vxml'
    if !File.file? vxml_file_path
      puts "Given document [#{vxml_file_path}] is not found."
      return
    end
    path_to_resources = Gvg::Helper.get_voicexml21_schema_dir
    dtd_path = File.join(path_to_resources, 'vxml.dtd')
    if Gvg::Processor.validate(vxml_file_path, dtd_path)
      puts "Given document [#{vxml_file_path}] is valid vxml."
    else
      puts "Given document [#{vxml_file_path}] is not valid vxml."
    end
  end
end

