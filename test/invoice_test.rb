require "./test/test_helper"
require "./lib/invoice"

class InvoiceTest < Minitest::Test

  def test_it_exists
    invoices = Invoice
  end

  def test_it_can_instantiate_an_invoice_object
    invoices = Parser.new.parse("sample_invoices.csv")
    @data = invoices[0]

    invoice = Invoice.new(@data)
    assert invoice
  end

  def test_it_has_an_invoice_id
    invoice = Parser.new.parse("sample_invoices.csv")
    @data = invoice[0]

    invoice = Invoice.new(@data)
    assert_equal "1", invoice.id
  end

  def test_there_is_a_invoice_id_for_the_invoice
    invoice = Parser.new.parse("sample_invoices.csv")
    @data = invoice[0]

    invoice = Invoice.new(@data)
    assert_equal "1", invoice.customer_id
  end

  def test_there_is_a_last_name_for_invoice
    invoice = Parser.new.parse("sample_invoices.csv")
    @data = invoice[0]

    invoice = Invoice.new(@data)
    assert_equal "26", invoice.merchant_id
  end

  def test_there_is_a_status_for_an_invoice
    invoice = Parser.new.parse("sample_invoices.csv")
    @data = invoice[0]

    invoice = Invoice.new(@data)
    assert_equal "shipped", invoice.status
  end

  def test_there_is_a_created_at_date
    invoice = Parser.new.parse("sample_invoices.csv")
    @data = invoice[0]

    invoice = Invoice.new(@data)
    assert_equal "2012-03-25 09:54:09 UTC", invoice.created_at
  end

  def test_there_is_an_updated_date
    invoice = Parser.new.parse("sample_invoices.csv")
    @data = invoice[0]

    invoice = Invoice.new(@data)
    assert_equal "2012-03-25 09:54:09 UTC", invoice.updated_at
  end

  def test_it_can_check_another_invoice_id
    invoice = Parser.new.parse("sample_invoices.csv")
    @data = invoice[5]

    invoice = Invoice.new(@data)
    assert_equal "6", invoice.id
  end
end
