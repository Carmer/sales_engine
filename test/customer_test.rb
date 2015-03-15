require "./test/test_helper"
require "./lib/sales_engine"


class CustomerTest < Minitest::Test

  def test_it_exists
    sample_customers = Customer
  end

  def setup
    sales_engine = SalesEngine.new
    @customer = sales_engine.customer_repository.find_by_id("1")
  end

  def test_it_has_attributes
    assert_equal "1", @customer.id
    assert_equal "Joey", @customer.first_name
    assert_equal "Ondricka", @customer.last_name
    assert_equal "2012-03-27 14:54:09 UTC", @customer.created_at
    assert_equal "2012-03-27 14:54:09 UTC", @customer.created_at
  end

  def test_it_find_all_invoices
    assert_equal 8, @customer.invoices.size
  end

  def test_it_can_return_transactions
    assert_equal 8, @customer.transactions.size
  end
end
