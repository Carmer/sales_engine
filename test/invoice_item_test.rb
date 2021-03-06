require "./test/test_helper"
require "./lib/invoice_item_repository"
require "./lib/sales_engine"
require "bigdecimal"

class InvoiceItemTest < Minitest::Test

  def setup
    sales_engine  = SalesEngine.new
    @invoice_item = sales_engine.invoice_item_repository.find_by_id(2)
    @invoice_item2 = sales_engine.invoice_item_repository.find_by_id(3)
  end

  def test_it_has_attributes
    assert_equal 2, @invoice_item.id
    assert_equal 9, @invoice_item.quantity
    assert_equal 23324, @invoice_item.unit_price.to_f
    assert_equal "2012-03-27 14:54:09 UTC", @invoice_item.created_at
    assert_equal "2012-03-27 14:54:09 UTC", @invoice_item.updated_at
  end

  def test_it_can_return_an_associated_invoice
    assert_equal 1, @invoice_item.invoice.id
  end

  def test_it_returns_an_item_instance
    assert_equal "Item Quae Dolore", @invoice_item.item.name
    assert_equal "Item Pariatur Quia", @invoice_item2.item.name
  end
end
