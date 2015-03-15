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

  def test_it_returns_a_collection_of_items_it_sells
    assert_equal 9, @merchant.items.size
    assert_equal "Item Aut Sit", @merchant.items[0].name
    assert_equal "Item Iste Occaecati", @merchant.items[3].name
  end

  def test_it_can_return_all_invoices
    assert_equal 1, @merchant.invoices.size
    assert_equal "12", @merchant.invoices[0].merchant_id
  end
end
