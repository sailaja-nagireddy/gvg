require 'json'

class Gvg::Parser
  def parse
    automaton = %{
      {
        "id": "1",
        "name": "State Machine 1",
        "type": "test",
        "description": "A test state machine.",
        "states": [
          {
            "id": "1",
            "sequence": "1",
            "name": "State 1",
            "type": "say",
            "description": "A test state.",
            "audio": {
              "source": "https://example.com/media/audio/1.mp3",
              "text": "I am in state 1."
            }
          },
          {
            "id": "2",
            "sequence": "2",
            "name": "State 2",
            "type": "say",
            "description": "A test state.",
            "audio": {
              "source": "https://example.com/media/audio/2.mp3",
              "text": "I am in state 2."
            }
          },
          {
            "id": "3",
            "sequence": "3",
            "name": "State 3",
            "type": "say",
            "description": "A test state.",
            "audio": {
              "source": "https://example.com/media/audio/3.mp3",
              "text": "I am in state 3."
            }
          }
        ]
      }
    }

    return JSON.parse(automaton)
  end
end

