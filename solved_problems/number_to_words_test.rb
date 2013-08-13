require_relative 'number_to_words'


require 'minitest/autorun'
require 'minitest/pride'

class SayInEnglishTest < MiniTest::Test

  def test_0
    assert_equal 'zero', Say.new(0).in_english
  end

  def test_10
    assert_equal 'ten', Say.new(10).in_english
  end
   
  def test_20
    assert_equal 'twenty', Say.new(20).in_english
  end

  def test_30
    assert_equal 'thirty', Say.new(30).in_english
  end
   
  def test_100
    assert_equal 'one hundred', Say.new(100).in_english
  end
   
  def test_130
    assert_equal 'one hundred and thirty', Say.new(130).in_english
  end
   
  def test_123
    assert_equal 'one hundred and twenty-three', Say.new(123).in_english
  end

  def test_901
    assert_equal 'nine hundred and one', Say.new(901).in_english
  end
   
  def test_1_thousand
    assert_equal 'one thousand', Say.new(1000).in_english
  end
   
  def test_1_thousand_234
    assert_equal 'one thousand two hundred and thirty-four', Say.new(1234).in_english
  end

  def test_15_thousand_234
    assert_equal 'fifteen thousand two hundred and thirty-four', Say.new(15234).in_english
  end

  def test_157_thousand_234
    assert_equal 'one hundred and fifty-seven thousand two hundred and thirty-four', Say.new(157234).in_english
  end
   
  def test_1_million
    assert_equal 'one million', Say.new(10**6).in_english
  end
   
  def test_1_million_and_some_crumbs
    assert_equal 'one million and two', Say.new(1000002).in_english
  end
   
  def test_1_million_2_thousand_345
    expected = 'one million two thousand three hundred and forty-five'
    assert_equal expected, Say.new(1002345).in_english
  end
   
  def test_1_billion_1_million_12
    assert_equal 'one billion one million and twelve', Say.new(10**9 + 10**6 + 12).in_english
  end
   
  def test_really_big_number
    expected = 'nine hundred and eighty-seven billion '
    expected << 'six hundred and fifty-four million '
    expected << 'three hundred and twenty-one thousand '
    expected << 'one hundred and twenty-three'
    assert_equal expected, Say.new(987654321123).in_english
  end

end
