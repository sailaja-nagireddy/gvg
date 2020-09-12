require 'minitest/autorun'
require 'gvg'

class AgnotTest < Minitest::Test
  def test_english_hello
    agnot = Gvg::Agnot.new
    assert_equal true,
      agnot.say("/media/audio/hello", "hello")
  end
end
