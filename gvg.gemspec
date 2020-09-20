Gem::Specification.new do |s|
  s.name        = 'gvg'
  s.version     = '0.0.3'
  s.executables << 'gvg'
  s.date        = '2020-09-12'
  s.summary     = "Generic VoiceXML Generator"
  s.description = "A voicexml generator based on state machine."
  s.authors     = ["Sailaja Nagireddy"]
  s.email       = 'sailaja.nagireddy@agnostic-foundation.org'
  s.files       = [
    "lib/gvg/agnot.rb",
    "lib/gvg/cli.rb",
    "lib/gvg/hello/translator.rb",
    "lib/gvg/hello.rb",
    "lib/gvg/helper.rb",
    "lib/gvg/processor.rb",
    "lib/gvg.rb",
    "resources/404.json",
    "resources/hello.json"
  ]
  s.require_paths << 'resources'
  s.homepage    = 'https://rubygems.org/gems/gvg'
  s.license     = 'MPL-2.0'
end
