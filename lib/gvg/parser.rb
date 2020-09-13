require 'json'

class Gvg::Parser
  def parse
    automaton = File.read('test/state-machine-1.json')
    return JSON.parse(automaton)
  end
end

