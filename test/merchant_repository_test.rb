require "./test/test_helper"
require "./lib/merchant_repository"

class TestMerchantRepository < Minitest::Test
  def test_it_exists
    assert MerchantRepository
  end

  def test_it_creates_an_array_of_objects
    merchants_data = Parser.new.parse("merchants.csv")

    merchants_array = MerchantRepository.new(merchants_data).merchants
    assert_equal 100, merchants_array.size
    assert_equal Array, merchants_array.class
  end

  def test_it_creates

  end
end
