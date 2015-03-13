require "./test/test_helper"
require "./lib/invoice_repository"

class InvoiceRepositortyTest < Minitest::Test

  def test_it_exists
    assert InvoiceRepository
  end

  def setup
    @invoice_data = Parser.new.parse("./data","sample_invoices.csv")
  end

  def test_it_creates_an_array_of_invoice_objects
    invoice_data = InvoiceRepository.new(@invoice_data, nil).invoices
    assert_equal 19, invoice_data.size
    assert_equal Array, invoice_data.class
  end
end
