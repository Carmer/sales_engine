require "./test/test_helper"
require "./lib/merchant"
require "./lib/sales_engine"

class TestMerchant < Minitest::Test

  def setup
    sales_engine = SalesEngine.new
    @merchant= sales_engine.merchant_repository.find_by_name('Dicki-Bednar')
    @merchant2 = sales_engine.merchant_repository.find_by_name('Schroeder-Jerde')
  end

  def test_a_merchant_has_attributes
    assert_equal "Dicki-Bednar", @merchant.name
    assert_equal 14, @merchant.id
    assert_equal "2012-03-27 14:54:00 UTC", @merchant.created_at
    assert_equal "2012-03-27 14:54:00 UTC", @merchant.updated_at
  end

  def test_it_returns_a_collection_of_items_it_sells
    assert_equal 1, @merchant.items.size
    assert_equal "Item Dicta Autem", @merchant.items[0].name
    assert_equal "Item Dicta Autem", @merchant.items[0].name
  end

  def test_it_can_return_all_invoices
    assert_equal 1, @merchant.invoices.size
    assert_equal 14 , @merchant.invoices[0].merchant_id
  end

  def test_it_returns_the_total_revenue
    assert_equal 24742.51, @merchant.revenue
  end

  def test_it_can_find_revenue_by_date
    assert_equal 24742.51, @merchant.revenue("2012-03-13 07:54:10 UTC")
  end

  def test_it_has_a_favorite_customer
    assert_equal 4, @merchant.favorite_customer.id
    assert_equal 7, @merchant2.favorite_customer.id
  end

  def test_it_finds_customers_with_pending_invoies
    assert_equal 0, @merchant.customers_with_pending_invoices.size
    assert_equal 0, @merchant2.customers_with_pending_invoices.size
  end
end
