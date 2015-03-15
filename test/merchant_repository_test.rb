require "./test/test_helper"
require "./lib/merchant_repository"
require "./lib/sales_engine"

class TestMerchantRepository < Minitest::Test

  def test_it_exists
    assert MerchantRepository
  end

  def setup
    @merchant_objects = SalesEngine.new.merchant_repository
  end

  def test_it_creates_an_array_of_merchants
    assert_equal 100, @merchant_objects.merchant.size
    assert_equal Array, @merchant_objects.merchant.class
  end

  def test_it_can_inspec_a_merchant_repostiory_can_inspec_itself
    assert_equal "#<MerchantRepository 100 rows>", @merchant_objects.inspect
  end

  def test_it_can_find_all_merchants
    result = @merchant_objects.all
    assert_equal 100, result.size
  end

  def test_it_can_find_a_random_merchant
    sample = []
    10.times {sample << @merchant_objects.random}
    assert sample.uniq
  end

  def test_it_can_find_a_merchant_by_id
    result = @merchant_objects.find_by_id("5")
    assert_equal "5", result.id
    assert_equal "Williamson Group", result.name
  end

  def test_it_can_find_a_merchant_by_name
    result = @merchant_objects.find_by_name("Cummings-Thiel")
    assert_equal "Cummings-Thiel", result.name
  end

  def test_it_can_find_all_merchants_by_name
    result = @merchant_objects.find_all_by_name("Williamson Group")
    assert_equal 2, result.size
    assert_equal "Williamson Group", result[1].name
    assert_equal "Williamson Group", result[0 ].name
  end

  def test_it_can_find_all_merchants_by_name_in_all_uppercase_letters
    result = @merchant_objects.find_all_by_name("WILLIAMSON GROUP")
    assert_equal 2, result.size
    assert_equal "Williamson Group", result[1].name
    assert_equal "Williamson Group", result[0 ].name
  end

  def test_it_can_find_all_merchants_by_name_in_all_lowercase_letters
    result = @merchant_objects.find_all_by_name("williamson group")
    assert_equal 2, result.size
    assert_equal "Williamson Group", result[1].name
    assert_equal "Williamson Group", result[0 ].name
  end

  def test_it_can_find_all_merchants_by_name_in_mixed_case_letters
    result = @merchant_objects.find_all_by_name("wilLiAMson GROUp")
    assert_equal 2, result.size
    assert_equal "Williamson Group", result[1].name
    assert_equal "Williamson Group", result[0 ].name
  end

  def test_it_can_find_a_merchant_by_name_in_all_uppercase_letters
    result = @merchant_objects.find_by_name("CUMMINGS-THIEL")
    assert_equal "Cummings-Thiel", result.name
  end

  def test_it_can_find_a_merchant_by_name_in_all_lowercase_letters
    result = @merchant_objects.find_by_name("cummings-thiel")
    assert_equal "Cummings-Thiel", result.name
  end

  def test_it_can_find_a_merchant_by_name_in_mixed_case_letters
    result = @merchant_objects.find_by_name("CuMMings-thiEL")
    assert_equal "Cummings-Thiel", result.name
  end

  def test_it_can_find_all_merchants_by_created_at
    assert_equal 9, @merchant_objects.find_all_by_created_at("2012-03-27 14:53:59 UTC").length
  end

  def test_it_can_find_all_merchants_by_updated_at
    assert_equal 12, @merchant_objects.find_all_by_updated_at("2012-03-27 14:54:00 UTC").length
  end

  def test_it_can_find_a_merchant_by_created_at
    assert_equal "Schroeder-Jerde", @merchant_objects.find_by_created_at("2012-03-27 14:53:59 UTC").name
  end

  def test_it_can_find_a_merchant_by_updated_at
    assert_equal "Schroeder-Jerde", @merchant_objects.find_by_updated_at("2012-03-27 14:53:59 UTC").name
  end

  def test_it_returns_an_array_of_the_merchants_with_the_most_revenue
    assert_equal 3, @merchant_objects.most_revenue(3).length
    assert_equal Array, @merchant_objects.most_revenue(3).class
    assert_equal ["44", "78", "84"], @merchant_objects.most_revenue(3).map {|merchant| merchant.id }
  end
end
