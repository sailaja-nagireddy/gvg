require 'aasm'

def audio(src, text)
  return <<-EOS
    <block>
      <prompt>
        <audio src="/media/audio/#{src}">#{text}</audio>
      </prompt>
    </block>
  EOS
end

def open
  return <<-EOS
    <?xml version="1.0" encoding="ISO-8859-1"?>
    <vxml version="2.0" lang="en">
  EOS
end

def close
  return <<-EOS
    </vxml>
  EOS
end

class Gvg::Agnot
  include AASM

  aasm whiny_transitions: false do
    state :waiting, initial: true
    state :saying, :listening, :working
    state :done

    event :start do
      transitions to: :waiting, after: Proc.new {|*args| puts open(*args)}
    end

    event :stop do
      transitions to: :done, after: Proc.new {|*args| puts close(*args)}
    end

    event :say do
      transitions from: :waiting, to: :saying, after: Proc.new {|*args| puts audio(*args)}
      transitions from: :listening, to: :saying, after: Proc.new {|*args| puts audio(*args)}
      transitions from: :saying, to: :saying, after: Proc.new {|*args| puts audio(*args)}
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

