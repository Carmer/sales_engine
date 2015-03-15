require "./test/test_helper"
require "./lib/invoice_items_repository"
require "./lib/sales_engine"

class InvoiceItemsTest < Minitest::Test

  def setup
    sales_engine = SalesEngine.new
    @invoice = sales_engine.invoice_items_repository.find_by_id("2")
  end

  def test_it_has_attributes
    assert_equal "2", @invoice.id
    assert_equal "9", @invoice.quantity
    assert_equal "23324", @invoice.unit_price
    assert_equal "2012-03-27 14:54:09 UTC", @invoice.created_at
    assert_equal "2012-03-27 14:54:09 UTC", @invoice.updated_at
  end
end
