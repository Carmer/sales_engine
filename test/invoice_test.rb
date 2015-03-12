require "./test/test_helper"
require "./lib/invoice"

class InvoiceTest < Minitest::Test

  def test_it_exists
    inv = Invoice
  end

  def setup
    @invoice = Parser.new.parse("./data/", "sample_invoices.csv")
  end

  def test_it_can_instantiate_an_invoice_object
    data = @invoice[0]
    inv = Invoice.new(data)
    assert inv
  end

  def test_it_has_an_invoice_id
    data = @invoice[0]
    inv = Invoice.new(data)
    assert_equal "1", inv.id
  end

  def test_there_is_a_invoice_id_for_the_invoice
    data = @invoice[0]
    inv = Invoice.new(data)
    assert_equal "1", inv.customer_id
  end

  def test_there_is_a_last_name_for_invoice
    data = @invoice[0]
    inv = Invoice.new(data)
    assert_equal "26", inv.merchant_id
  end

  def test_there_is_a_status_for_an_invoice
    data = @invoice[0]
    inv = Invoice.new(data)
    assert_equal "shipped", inv.status
  end

  def test_there_is_a_created_at_date
    data = @invoice[0]
    inv = Invoice.new(data)
    assert_equal "2012-03-25 09:54:09 UTC", inv.created_at
  end

  def test_there_is_an_updated_date
    data = @invoice[0]
    inv = Invoice.new(data)
    assert_equal "2012-03-25 09:54:09 UTC", inv.updated_at
  end

  def test_it_can_check_another_invoice_id
    data = @invoice[5]
    inv = Invoice.new(data)
    assert_equal "6", inv.id
  end
end
