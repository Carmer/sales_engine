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

  def test_it_can_find_a_random_invoice
    invoice1 = InvoiceRepository.new(@invoice_data, nil)
    sample = []
    10.times {sample << invoice1.random}
    assert sample.uniq
  end

  def test_it_can_inspect_itself
    invoice1 =InvoiceRepository.new(@invoice_data, nil).inspect
    assert_equal "#<InvoiceRepository 19 rows>", invoice1
  end

  def test_it_can_find_by_invoice_status
    invoice1 = InvoiceRepository.new(@invoice_data, nil)
    result = invoice1.find_by_status("shipped")
    assert_equal "shipped", result.status
  end

  def test_it_can_find_by_invoice_status_input_as_all_uppercase
    invoice1 = InvoiceRepository.new(@invoice_data, nil)
    result = invoice1.find_by_status("SHIPPED")
    assert_equal "shipped", result.status
  end

  def test_it_can_find_by_invoice_status_input_as_mixed_case_letters
    invoice1 = InvoiceRepository.new(@invoice_data, nil)
    result = invoice1.find_by_status("SHIppED")
    assert_equal "shipped", result.status
  end

  def test_it_can_find_all_by_invoice_status_input_as_mixed_case_letters
    invoice1 = InvoiceRepository.new(@invoice_data, nil)
    result = invoice1.find_all_by_status("SHIppED")
    assert_equal 19, result.size
    assert_equal "shipped", result[3].status
  end

  def test_it_can_find_by_id
    invoice1 = InvoiceRepository.new(@invoice_data, nil)
    result1 = invoice1.find_by_id("2")
    assert_equal "2", result1.id
    result2 = invoice1.find_by_id("4")
    assert_equal "4", result2.id
  end

  def test_it_can_find_by_customer_id
    invoice1 = InvoiceRepository.new(@invoice_data, nil)
    result = invoice1.find_by_customer_id("4")
    assert_equal "4", result.customer_id
  end

  def test_it_can_find_all_by_customer_id
    invoice1 = InvoiceRepository.new(@invoice_data, nil)
    result = invoice1.find_all_by_customer_id("3")
    assert_equal 4, result.size
    assert_equal "3", result[2].customer_id
    assert_equal "8", result[2].merchant_id
  end

  def test_it_can_find_by_merchant_id
    invoice1 = InvoiceRepository.new(@invoice_data, nil)
    result = invoice1.find_by_merchant_id("26")
    assert_equal "26", result.merchant_id
  end

  def test_it_can_find_all_by_merchants_id
    invoice1 = InvoiceRepository.new(@invoice_data, nil)
    result = invoice1.find_all_by_merchant_id("27")
    assert_equal 2, result.size
    assert_equal "27", result[0].merchant_id
    assert_equal "9", result[0].id
    assert_equal "2", result[0].customer_id
  end

  def test_it_can_find_all_by_merchant_id
    invoice1 = InvoiceRepository.new(@invoice_data, nil)
    result = invoice1.find_by_merchant_id("76")
    assert_equal "76", result.merchant_id
  end

  def test_it_can_find_all_invoices_by_created_at
    invoice1 = InvoiceRepository.new(@invoice_data, nil)
    assert_equal 1, invoice1.find_all_by_created_at("2012-03-24 15:54:10 UTC").length
  end

  def test_it_can_find_all_invoices_by_updated_at
    invoice1 = InvoiceRepository.new(@invoice_data, nil)
    assert_equal 1, invoice1.find_all_by_updated_at("2012-03-09 01:54:10 UTC").length
  end

  def test_it_can_find_a_invoice_by_created_at
    invoice1 = InvoiceRepository.new(@invoice_data, nil)
    assert_equal "4", invoice1.find_by_created_at("2012-03-24 15:54:10 UTC").id
  end

  def test_it_can_find_a_invoice_by_updated_at
    invoice1 = InvoiceRepository.new(@invoice_data, nil)
    assert_equal "6", invoice1.find_by_updated_at("2012-03-09 01:54:10 UTC").id
  end
end
