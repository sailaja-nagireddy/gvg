# A multi-lingual hello class to say hello in multiple languages.
class Gvg::Hello
  # Say hi to the world!
  #
  # Example:
  #   >> Hola.hi("spanish")
  #
  # Arguments:
  #   language: (String)

  def self.hi(language = "english")
    translator = Translator.new(language)
    translator.hi
  end
end

require 'gvg/hello/translator'
