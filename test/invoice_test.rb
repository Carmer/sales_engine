require "./test/test_helper"
require "./lib/invoice"
require "./lib/sales_engine"

class InvoiceTest < Minitest::Test

  def test_it_exists
    inv = Invoice
  end

  def setup
    sales_engine = SalesEngine.new
    @invoice = sales_engine.invoice_repository.find_by_id("3")
  end


  def test_it_has_attributes
    assert_equal "3", @invoice.id
    assert_equal "1", @invoice.customer_id
    assert_equal "78", @invoice.merchant_id
    assert_equal "shipped", @invoice.status
    assert_equal "2012-03-10 00:54:09 UTC", @invoice.created_at
    assert_equal "2012-03-10 00:54:09 UTC", @invoice.updated_at
  end
end
