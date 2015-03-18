require "./test/test_helper"
require "./lib/invoice"
require "./lib/sales_engine"

class InvoiceTest < Minitest::Test

  def test_it_exists
    inv = Invoice
  end

  def setup
    sales_engine = SalesEngine.new
    @invoice = sales_engine.invoice_repository.find_by_id(12)
  end


  def test_it_has_attributes
    assert_equal 12, @invoice.id
    assert_equal 3, @invoice.customer_id
    assert_equal 8, @invoice.merchant_id
    assert_equal "shipped", @invoice.status
    assert_equal Date.parse("2012-03-21 13:54:10 UTC"), @invoice.created_at
    assert_equal "2012-03-21 13:54:10 UTC", @invoice.updated_at
  end

  def test_it_can_return_all_transactions
    assert_equal 3, @invoice.transactions.size
  end

  def test_it_can_return_all_invoice_items
    assert_equal 6, @invoice.invoice_items.size
  end

  def test_it_can_return_all_items
    assert_equal 5, @invoice.items.size
  end

  def test_it_can_return_associated_customer
    assert_equal "Mariah", @invoice.customer.first_name
  end

  def test_it_can_return_associated_merchant
    assert_equal "Osinski, Pollich and Koelpin", @invoice.merchant.name
  end
end
