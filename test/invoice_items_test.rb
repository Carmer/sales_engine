require "./test/test_helper"
require "./lib/invoice_items_repository"
require "./lib/sales_engine"
require "bigdecimal"

class InvoiceItemsTest < Minitest::Test

  def setup
    sales_engine  = SalesEngine.new
    @invoice_item = sales_engine.invoice_items_repository.find_by_id("2")
  end

  def test_it_has_attributes
    assert_equal "2", @invoice_item.id
    assert_equal "9", @invoice_item.quantity
    assert_equal "233.24", @invoice_item.unit_price.to_f.to_s
    assert_equal "2012-03-27 14:54:09 UTC", @invoice_item.created_at
    assert_equal "2012-03-27 14:54:09 UTC", @invoice_item.updated_at
  end

  def test_it_can_return_an_associated_invoice
    assert_equal "1", @invoice_item.invoice.id
  end

  def test_it_returns_an_item_instance
    assert_equal "Item Quae Dolore", @invoice_item.item.name
  end

end
