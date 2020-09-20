require 'minitest/autorun'
require 'gvg'

class AgnotTest < Minitest::Test
  def test_agnot_say
    agnot = Gvg::Agnot.new
    agnot.start
    assert_equal true,
      agnot.say({:source => "/media/audio/hello", :text => "hello"})
    agnot.stop('/tmp/test.vxml')
  end
end
