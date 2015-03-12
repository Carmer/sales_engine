require "./test/test_helper"
require "./lib/invoice_items_repository"

class InvoiceItemsTest < Minitest::Test

  def setup
    @invoice_items = Parser.new.parse("./data/", "sample_invoice_items.csv")
  end

  def test_it_exists
    items_from_invoices = InvoiceItems
  end

  def test_it_can_instantiate_an_invoice_item_object
    data = @invoice_items[0]

    invoice_items = InvoiceItems.new(data)
    assert invoice_items
  end

  def test_there_is_an_invoice_item_id
    data = @invoice_items[1]

    invoice_items = InvoiceItems.new(data)
    assert_equal "2", invoice_items.id
  end

  def test_there_is_are_item_ids
    data  = @invoice_items[4]
    data1 = @invoice_items[9]

    invoice_items = InvoiceItems.new(data)
    assert_equal "529", invoice_items.item_id
    invoice_items1 = InvoiceItems.new(data1)
    assert_equal "1830", invoice_items1.item_id
  end

  def test_there_is_an_invoice_id_asssociated_with_an_invoice_item
    data  = @invoice_items[3]
    data1 = @invoice_items[4]

    invoice_items  = InvoiceItems.new(data)
    assert_equal "1", invoice_items.invoice_id
    invoice_items_1 = InvoiceItems.new(data1)
    assert_equal "1", invoice_items_1.invoice_id
  end

  def test_there_is_a_quantity_in_the_invoice_items_table
    data  = @invoice_items[7]
    data1 = @invoice_items[9]

    invoice_items  = InvoiceItems.new(data)
    assert_equal "6", invoice_items.quantity
    invoice_items_1 = InvoiceItems.new(data1)
    assert_equal "4", invoice_items_1.quantity
  end

  def test_there_is_a_unit_price
    data  = @invoice_items[3]
    data1 = @invoice_items[7]

    invoice_items  = InvoiceItems.new(data)
    assert_equal "2196", invoice_items.unit_price
    invoice_items_1 = InvoiceItems.new(data1)
    assert_equal "76941", invoice_items_1.unit_price
  end

  def test_there_is_a_time_associated_with_the_creation_of_the_invoice_item
    data  = @invoice_items[5]
    data1 = @invoice_items[8]

    invoice_items  = InvoiceItems.new(data)
    assert_equal "2012-03-27 14:54:10 UTC", invoice_items.created_at
    invoice_items_1 = InvoiceItems.new(data1)
    assert_equal "2012-03-27 14:54:10 UTC", invoice_items_1.created_at
  end

  def test_there_is_a_time_associated_with_the_creation_of_the_invoice_item
    data  = @invoice_items[6]
    data1 = @invoice_items[8]

    invoice_items  = InvoiceItems.new(data)
    assert_equal "2012-03-27 14:54:09 UTC", invoice_items.updated_at
    invoice_items_1 = InvoiceItems.new(data1)
    assert_equal "2012-03-27 14:54:09 UTC", invoice_items_1.updated_at
  end
end
