require 'minitest/autorun'
require 'gvg'

class GvgTest < Minitest::Test
  def test_english_hello
    assert_equal "hello world",
      Gvg::Hello.hi("english")
  end

  def test_any_hello
    assert_equal "hello world",
      Gvg::Hello.hi("ruby")
  end

  def test_spanish_hello
    assert_equal "hola mundo",
      Gvg::Hello.hi("spanish")
  end
end
