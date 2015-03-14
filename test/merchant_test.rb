require "./test/test_helper"
require "./lib/merchant"
require "./lib/sales_engine"

class TestMerchant < Minitest::Test

  def setup
    sales_engine = SalesEngine.new
    @merchant= sales_engine.merchant_repository.find_by_id("12")
  end

  def test_a_merchant_has_attributes
    assert_equal "Kozey Group", @merchant.name
    assert_equal "12", @merchant.id
    assert_equal "2012-03-27 14:54:00 UTC", @merchant.created_at
    assert_equal "2012-03-27 14:54:00 UTC", @merchant.updated_at
  end
end
