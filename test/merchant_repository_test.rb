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

  def test_an_object_has_a_name
    merchants_data = Parser.new.parse("merchants.csv")

    merchants_array = MerchantRepository.new(merchants_data).merchants
    assert_equal "Schroeder-Jerde", merchants_array[0].name
  end

  def test_a_different_object_has_a_name
    merchants_data = Parser.new.parse("merchants.csv")

    merchants_array = MerchantRepository.new(merchants_data).merchants
    assert_equal "Williamson Group", merchants_array[5].name
  end

  def test_an_object_has_an_id
    merchants_data = Parser.new.parse("merchants.csv")

    merchants_array = MerchantRepository.new(merchants_data).merchants
    assert_equal "6", merchants_array[5].id
  end

  def test_another_object_has_an_id
    merchants_data = Parser.new.parse("merchants.csv")

    merchants_array = MerchantRepository.new(merchants_data).merchants
    assert_equal "46", merchants_array[45].id
  end

  def test_an_object_has_a_create_at
    merchants_data = Parser.new.parse("merchants.csv")

    merchants_array = MerchantRepository.new(merchants_data).merchants
    assert_equal "2012-03-27 14:54:09 UTC", merchants_array[99].created_at
  end

  def test_another_object_has_a_create_at
    merchants_data = Parser.new.parse("merchants.csv")

    merchants_array = MerchantRepository.new(merchants_data).merchants
    assert_equal "2012-03-27 14:54:08 UTC", merchants_array[94].created_at
  end

  def test_an_object_has_an_updated_at
    merchants_data = Parser.new.parse("merchants.csv")

    merchants_array = MerchantRepository.new(merchants_data).merchants
    assert_equal "2012-03-27 14:54:03 UTC", merchants_array[45].updated_at
  end

  def test_another_object_has_an_updated_at
    merchants_data = Parser.new.parse("merchants.csv")

    merchants_array = MerchantRepository.new(merchants_data).merchants
    assert_equal "2012-03-27 14:53:59 UTC", merchants_array[8].updated_at            

  end
end
