require "./test/test_helper"
require "./lib/merchant_repository"

class TestMerchantRepository < Minitest::Test

  def test_it_exists
    assert MerchantRepository
  end

  def setup
    @merchants = Parser.new.parse("./data", "sample_merchants.csv")
  end

  def test_it_creates_an_array_of_merchants
    assert_equal 19, @merchants.size
    assert_equal Array, @merchants.class
  end

  def test_a_merchant_has_a_name
    merch = MerchantRepository.new(@merchants, nil).merchant
    assert_equal "Schroeder-Jerde", merch[0].name
  end

  def test_a_different_merchant_has_a_name
    merch = MerchantRepository.new(@merchants, nil).merchant
    assert_equal "Williamson Group", merch[5].name
  end

  def test_it_can_inspec_a_merchant_repostiory_can_inspec_itself
    merch = MerchantRepository.new(@merchants, nil).inspect
    assert_equal "#<MerchantRepository 19 rows>", merch
  end

  def test_a_merchant_has_an_id
    merch = MerchantRepository.new(@merchants, nil).merchant
    assert_equal "6", merch[5].id
  end

  def test_it_can_find_all_merchants
    merch = MerchantRepository.new(@merchants, nil)
    result = merch.all
    assert_equal 19, result.size
  end

  def test_it_can_find_a_random_merchant
    merch = MerchantRepository.new(@merchants, nil)
    sample = []
    10.times {sample << merch.random}
    assert sample.uniq
  end

  def test_another_merchant_has_an_id
    merch = MerchantRepository.new(@merchants, nil).merchant
    assert_equal "16", merch[15].id
  end

  def test_a_merchant_has_a_create_at
    merch = MerchantRepository.new(@merchants, nil).merchant
    assert_equal "2012-03-27 14:54:00 UTC", merch[9].created_at
  end

  def test_another_merchant_has_a_create_at
    merch = MerchantRepository.new(@merchants, nil).merchant
    assert_equal "2012-03-27 14:53:59 UTC", merch[7].created_at
  end

  def test_a_merchant_has_an_updated_at
    merch = MerchantRepository.new(@merchants, nil).merchant
    assert_equal "2012-03-27 14:53:59 UTC", merch[4].updated_at
  end

  def test_another_merchant_has_an_updated_at
    merch = MerchantRepository.new(@merchants, nil).merchant
    assert_equal "2012-03-27 14:53:59 UTC", merch[8].updated_at
  end

  def test_it_can_find_a_merchant_by_id
    merch = MerchantRepository.new(@merchants, nil)
    result = merch.find_by_id("5")
    assert_equal "5", result.id
    assert_equal "Williamson Group", result.name
  end

  def test_it_can_find_a_merchant_by_name
    merch = MerchantRepository.new(@merchants, nil)
    result = merch.find_by_name("Cummings-Thiel")
    assert_equal "Cummings-Thiel", result.name
  end

  def test_it_can_find_all_merchants_by_name
    merch = MerchantRepository.new(@merchants, nil)
    result = merch.find_all_by_name("Williamson Group")
    assert_equal 2, result.size
    assert_equal "Williamson Group", result[1].name
    assert_equal "Williamson Group", result[0 ].name
  end

  def test_it_can_find_all_merchants_by_name_in_all_uppercase_letters
    merch = MerchantRepository.new(@merchants, nil)
    result = merch.find_all_by_name("WILLIAMSON GROUP")
    assert_equal 2, result.size
    assert_equal "Williamson Group", result[1].name
    assert_equal "Williamson Group", result[0 ].name
  end

  def test_it_can_find_all_merchants_by_name_in_all_lowercase_letters
    merch = MerchantRepository.new(@merchants, nil)
    result = merch.find_all_by_name("williamson group")
    assert_equal 2, result.size
    assert_equal "Williamson Group", result[1].name
    assert_equal "Williamson Group", result[0 ].name
  end

  def test_it_can_find_all_merchants_by_name_in_mixed_case_letters
    merch = MerchantRepository.new(@merchants, nil)
    result = merch.find_all_by_name("wilLiAMson GROUp")
    assert_equal 2, result.size
    assert_equal "Williamson Group", result[1].name
    assert_equal "Williamson Group", result[0 ].name
  end

  def test_it_can_find_a_merchant_by_name_in_all_uppercase_letters
    merch = MerchantRepository.new(@merchants, nil)
    result = merch.find_by_name("CUMMINGS-THIEL")
    assert_equal "Cummings-Thiel", result.name
  end

  def test_it_can_find_a_merchant_by_name_in_all_lowercase_letters
    merch = MerchantRepository.new(@merchants, nil)
    result = merch.find_by_name("cummings-thiel")
    assert_equal "Cummings-Thiel", result.name
  end

  def test_it_can_find_a_merchant_by_name_in_mixed_case_letters
    merch = MerchantRepository.new(@merchants, nil)
    result = merch.find_by_name("CuMMings-thiEL")
    assert_equal "Cummings-Thiel", result.name
  end

  def test_it_can_find_all_merchants_by_created_at
    merch = MerchantRepository.new(@merchants, nil)
    assert_equal 9, merch.find_all_by_created_at("2012-03-27 14:53:59 UTC").length
  end

  def test_it_can_find_all_merchants_by_updated_at
    merch = MerchantRepository.new(@merchants, nil)
    assert_equal 10, merch.find_all_by_updated_at("2012-03-27 14:54:00 UTC").length
  end

  def test_it_can_find_a_merchant_by_created_at
    merch = MerchantRepository.new(@merchants, nil)
    assert_equal "Schroeder-Jerde", merch.find_by_created_at("2012-03-27 14:53:59 UTC").name
  end

  def test_it_can_find_a_merchant_by_updated_at
    merch = MerchantRepository.new(@merchants, nil)
    assert_equal "Schroeder-Jerde", merch.find_by_updated_at("2012-03-27 14:53:59 UTC").name
  end
end
