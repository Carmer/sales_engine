require "./test/test_helper"
# require "./lib/customer"
require "./lib/sales_engine"


class CustomerTest < Minitest::Test

  def test_it_exists
    sample_customers = Customer
  end

  def setup
    sales_engine = SalesEngine.new
    @customer = sales_engine.customer_repository.find_by_id("1")
  end

  def test_it_has_customer_id
    assert_equal "1", @customer.id
    assert_equal "Joey", @customer.first_name
  end

  def test_it_find_all_invoices
    assert_equal 8, @customer.invoices.count
  end
end
