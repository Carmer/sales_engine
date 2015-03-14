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
    invoice1 = InvoiceRepository.new(@invoice_data, nil).invoices
    assert_equal 19, invoice1.size
    assert_equal Array, invoice1.class
  end

  def test_it_can_find_by_invoice_status
    invoice1 = InvoiceRepository.new(@invoice_data, nil)
    result = invoice1.find_by_status("shipped")
    assert_equal "shipped", result.status
  end


end
