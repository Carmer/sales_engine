require "./test/test_helper"
require "./lib/merchant_repository"

class TestMerchantRepository < Minitest::Test

  def test_it_exists
    assert MerchantRepository
  end

  def setup
    @merchants = Parser.new.parse("./data", "sample_merchants.csv")
  end

  def test_it_creates_an_array_of_objects
    assert_equal 19, @merchants.size
    assert_equal Array, @merchants.class
  end

  def test_an_object_has_a_name
    merch = MerchantRepository.new(@merchants, nil).merchant
    assert_equal "Schroeder-Jerde", merch[0].name
  end

  def test_a_different_object_has_a_name
    merch = MerchantRepository.new(@merchants, nil).merchant
    assert_equal "Williamson Group", merch[5].name
  end

  def test_an_object_has_an_id
    merch = MerchantRepository.new(@merchants, nil).merchant
    assert_equal "6", merch[5].id
  end

  def test_another_object_has_an_id
    merch = MerchantRepository.new(@merchants, nil).merchant
    assert_equal "16", merch[15].id
  end

  def test_an_object_has_a_create_at
    merch = MerchantRepository.new(@merchants, nil).merchant
    assert_equal "2012-03-27 14:54:00 UTC", merch[9].created_at
  end

  def test_another_object_has_a_create_at
    merch = MerchantRepository.new(@merchants, nil).merchant
    assert_equal "2012-03-27 14:53:59 UTC", merch[7].created_at
  end

  def test_an_object_has_an_updated_at
    merch = MerchantRepository.new(@merchants, nil).merchant
    assert_equal "2012-03-27 14:53:59 UTC", merch[4].updated_at
  end

  def test_another_object_has_an_updated_at
    merch = MerchantRepository.new(@merchants, nil).merchant
    assert_equal "2012-03-27 14:53:59 UTC", merch[8].updated_at
  end
end
