require 'pathname'
require Pathname.new(__dir__) + 'minitest_helper'

class TestIntegerToEnglish < MiniTest::Test
  def test_that_it_has_a_version_number
    refute_nil ::IntegerToEnglish::VERSION
  end

  def test_integer_augmented
    assert 0.respond_to?(:to_english), 'Integer has not been taught to speak English'
  end

  def test_should_convert_0_to_9
    assert_equal 'zero', 0.to_english
    assert_equal 'one', 1.to_english
    assert_equal 'two', 2.to_english
    assert_equal 'three', 3.to_english
    assert_equal 'four', 4.to_english
    assert_equal 'five', 5.to_english
    assert_equal 'six', 6.to_english
    assert_equal 'seven', 7.to_english
    assert_equal 'eight', 8.to_english
    assert_equal 'nine', 9.to_english
  end

  def test_should_convert_10s
    assert_equal 'ten', 10.to_english
    assert_equal 'twenty', 20.to_english
    assert_equal 'thirty', 30.to_english
    assert_equal 'forty', 40.to_english
    assert_equal 'fifty', 50.to_english
    assert_equal 'sixty', 60.to_english
    assert_equal 'seventy', 70.to_english
    assert_equal 'eighty', 80.to_english
    assert_equal 'ninety', 90.to_english
  end

  def test_should_convert_11_to_19
    assert_equal 'eleven', 11.to_english
    assert_equal 'twelve', 12.to_english
    assert_equal 'thirteen', 13.to_english
    assert_equal 'fourteen', 14.to_english
    assert_equal 'fifteen', 15.to_english
    assert_equal 'sixteen', 16.to_english
    assert_equal 'seventeen', 17.to_english
    assert_equal 'eighteen', 18.to_english
    assert_equal 'nineteen', 19.to_english
  end

  def test_should_convert_21_to_99
    assert_equal 'twenty-one', 21.to_english
    assert_equal 'forty-two', 42.to_english
    assert_equal 'sixty-five', 65.to_english
    assert_equal 'ninety-nine', 99.to_english
  end

  def test_should_deal_with_prefix
    assert_equal 'sixty-five', +65.to_english
    assert_equal 'sixty-five', -65.to_english
  end

  def test_should_convert_100s
    assert_equal 'one hundred', 100.to_english
    assert_equal 'two hundred', 200.to_english
    assert_equal 'nine hundred', 900.to_english
  end

  def test_should_convert_hundreds_in_usa
    assert_equal 'two hundred seventy-three', 273.to_english(:us)
    assert_equal 'five hundred six', 506.to_english(:us)
    assert_equal 'four hundred fifty-three', 453.to_english('us')
  end

  def test_should_convert_hundreds_in_british
    assert_equal 'two hundred and seventy-three', 273.to_english
    assert_equal 'five hundred and six', 506.to_english
  end

  def test_should_convert_1000s
    assert_equal 'one thousand', 1000.to_english
    assert_equal 'two thousand', 2000.to_english
    assert_equal 'nine thousand', 9000.to_english
  end

  def test_should_convert_millions
    assert_equal 'one million', 1000000.to_english
    assert_equal 'two million', 2000000.to_english
    assert_equal 'nine million', 9000000.to_english
  end

  def test_should_convert_billions
    assert_equal 'one billion', 1000000000.to_english
    assert_equal 'two billion', 2000000000.to_english
    assert_equal 'nine billion', 9000000000.to_english
  end

  def test_should_convert_trillions
    assert_equal 'one trillion', 1000000000000.to_english
    assert_equal 'two trillion', 2000000000000.to_english
    assert_equal 'nine trillion', 9000000000000.to_english
  end

  def test_should_convert_quadrillions
    assert_equal 'one quadrillion', 1000000000000000.to_english
    assert_equal 'two quadrillion', 2000000000000000.to_english
    assert_equal 'nine quadrillion', 9000000000000000.to_english
  end

  # TODO more tricky and complex numbers

  #list of random numbers, should be listing tricky ones
  def test_should_convert_any_numbers_it_could
    assert_equal 'forty-three thousand four hundred and two', 43402.to_english
    assert_equal 'three hundred thirty thousand four hundred two', 330402.to_english(:us)
    assert_equal(
        'six hundred twenty-three quadrillion seven hundred seventy-seven trillion four million three thousand four hundred two',
        623777000004003402.to_english(:us)
    )
    assert_equal(
        'six hundred and twenty-three quadrillion seven hundred and seventy-seven trillion four million three thousand four hundred and two',
        623777000004003402.to_english(:gb)
    )

  end
end
