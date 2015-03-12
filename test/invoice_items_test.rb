require './test/test_helper'
require './lib/invoice_items_repository'

class InvoiceItemsTest < Minitest::Test

  def test_it_exists
    items_from_invoices = InvoiceItems
  end

  def test_it_can_instantiate_an_invoice_item_object
    invoice_items = Parser.new.parse("sample_invoice_items.csv")
    @data = invoice_items[0]

    invoice_items = InvoiceItems.new(@data)
    assert invoice_items
  end

  def test_there_is_an_invoice_item_id
    invoice_items = Parser.new.parse("sample_invoice_items.csv")
    @data = invoice_items[1]

    invoice_items = InvoiceItems.new(@data)
    assert_equal "2", invoice_items.id
  end

  def test_there_is_are_item_ids
    invoice_items = Parser.new.parse("sample_invoice_items.csv")
    @data  = invoice_items[4]
    @data1 = invoice_items[9]

    invoice_items = InvoiceItems.new(@data)
    assert_equal "529", invoice_items.item_id
    invoice_items1 = InvoiceItems.new(@data1)
    assert_equal "1830", invoice_items1.item_id
  end

  def test_there_is_an_invoice_id_asssociated_with_an_invoice_item
    invoice_items = Parser.new.parse("sample_invoice_items.csv")
    @data  = invoice_items[3]
    @data1 = invoice_items[44]

    i  = InvoiceItems.new(@data)
    assert_equal "1", i.invoice_id
    ii = InvoiceItems.new(@data1)
    assert_equal "8", ii.invoice_id
  end

  def test_there_is_a_quantity_in_the_invoice_items_table
    invoice_items = Parser.new.parse("sample_invoice_items.csv")
    @data  = invoice_items[77]
    @data1 = invoice_items[9]

    i  = InvoiceItems.new(@data)
    assert_equal "1", i.quantity
    ii = InvoiceItems.new(@data1)
    assert_equal "4", ii.quantity
  end

  def test_there_is_a_unit_price
    invoice_items = Parser.new.parse("sample_invoice_items.csv")
    @data  = invoice_items[3]
    @data1 = invoice_items[7]

    i  = InvoiceItems.new(@data)
    assert_equal "2196", i.unit_price
    ii = InvoiceItems.new(@data1)
    assert_equal "76941", ii.unit_price
  end

  def test_there_is_a_time_associated_with_the_creation_of_the_invoice_item
    invoice_items = Parser.new.parse("sample_invoice_items.csv")
    @data  = invoice_items[65]
    @data1 = invoice_items[8]

    i  = InvoiceItems.new(@data)
    assert_equal "2012-03-27 14:54:10 UTC", i.created_at
    ii = InvoiceItems.new(@data1)
    assert_equal "2012-03-27 14:54:10 UTC", i.created_at
  end

  def test_there_is_a_time_associated_with_the_creation_of_the_invoice_item
    invoice_items = Parser.new.parse("sample_invoice_items.csv")
    @data  = invoice_items[65]
    @data1 = invoice_items[8]

    i  = InvoiceItems.new(@data)
    assert_equal "2012-03-27 14:54:10 UTC", i.updated_at
    ii = InvoiceItems.new(@data1)
    assert_equal "2012-03-27 14:54:10 UTC", i.updated_at
  end
end
