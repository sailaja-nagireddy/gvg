require 'json'

class Gvg::Parser
  def parse(filename)
    return JSON.parse(File.read(filename))
  end
end

