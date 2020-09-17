require 'gvg'
require 'thor'

def resource_path
  File.join(File.dirname(File.expand_path(__FILE__)), '../../resources')
end

class Gvg::Cli < Thor
  class_option :verbose, :type => :boolean, :aliases => "-v"

  desc "generate", "Generates VoiceXML from a given source file."
  method_option :source, :aliases => "-s", :desc => "Specify the input file path. (Default: JSON)"
  method_option :source_format, :desc => "Specify the source format."
  method_option :destination, :aliases => "-d", :desc => "Specify the output file path."
  method_option :destination_format, :desc => "Specify the destination format. (Default: VoiceXML 2.0)"
  def generate
    agnot = Gvg::Agnot.new
    parser = Gvg::Parser.new
    defaults = { source: File.join(resource_path(), 'hello.json'), destination: '/tmp/hello.vxml' }
    notfound = File.join(resource_path(), '404.json')

    source = options[:source] || defaults[:source]
    source = File.file?(source) ? source : notfound

    automaton = parser.parse(source)

    agnot.start
    states = automaton['states']
    for state in states
      agnot.send(state['type'], state['audio'])
    end
    agnot.stop
  end
end

