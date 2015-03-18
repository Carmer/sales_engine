require "./test/test_helper"
require "./lib/invoice_repository"
require "./lib/sales_engine"

class InvoiceRepositortyTest < Minitest::Test

  def test_it_exists
    assert InvoiceRepository
  end

  def setup
    @invoice_objects = SalesEngine.new.invoice_repository
  end

  def test_it_creates_an_array_of_invoice_objects
    assert_equal 101, @invoice_objects.invoices.size
    assert_equal Array, @invoice_objects.invoices.class
  end

  def test_it_can_find_a_random_invoice
    sample = []
    10.times {sample << @invoice_objects.random}
    assert sample.uniq
  end

  def test_it_can_inspect_itself
    assert_equal "#<InvoiceRepository 101 rows>", @invoice_objects.inspect
  end

  def test_it_can_find_by_invoice_status
    result = @invoice_objects.find_by_status("shipped")
    assert_equal "shipped", result.status
  end

  def test_it_can_find_by_invoice_status_input_as_all_uppercase
    result = @invoice_objects.find_by_status("SHIPPED")
    assert_equal "shipped", result.status
  end

  def test_it_can_find_by_invoice_status_input_as_mixed_case_letters
    result = @invoice_objects.find_by_status("SHIppED")
    assert_equal "shipped", result.status
  end

  def test_it_can_find_all_by_invoice_status_input_as_mixed_case_letters
    result = @invoice_objects.find_all_by_status("SHIppED")
    assert_equal 101, result.size
    assert_equal "shipped", result[3].status
  end

  def test_it_can_find_by_id
    result1 = @invoice_objects.find_by_id(2)
    assert_equal 2, result1.id
    result2 = @invoice_objects.find_by_id(4)
    assert_equal 4, result2.id
  end

  def test_it_can_find_by_customer_id
    result = @invoice_objects.find_by_customer_id(4)
    assert_equal 4, result.customer_id
  end

  def test_it_can_find_all_by_customer_id
    result = @invoice_objects.find_all_by_customer_id(3)
    assert_equal 4, result.size
    assert_equal 3, result[2].customer_id
    assert_equal 8, result[2].merchant_id
  end

  def test_it_can_find_by_merchant_id
    result = @invoice_objects.find_by_merchant_id(26)
    assert_equal 26, result.merchant_id
  end

  def test_it_can_find_all_by_merchants_id
    result = @invoice_objects.find_all_by_merchant_id(27)
    assert_equal 3, result.size
    assert_equal 27, result[0].merchant_id
    assert_equal 9, result[0].id
    assert_equal 2, result[0].customer_id
  end

  def test_it_can_find_all_by_merchant_id
    result = @invoice_objects.find_by_merchant_id(76)
    assert_equal 8, result.merchant_id.size
  end

  def test_it_can_find_all_invoices_by_created_at
      assert_equal 6, @invoice_objects.find_all_by_created_at(Date.parse("2012-03-24 15:54:10 UTC")).length
  end

  def test_it_can_find_all_invoices_by_updated_at
    assert_equal 1, @invoice_objects.find_all_by_updated_at("2012-03-09 01:54:10 UTC").length
  end

  def test_it_can_find_a_invoice_by_created_at
    assert_equal 4, @invoice_objects.find_by_created_at(Date.parse("2012-03-24 15:54:10 UTC")).id
  end

  def test_it_can_find_a_invoice_by_updated_at
    assert_equal 6, @invoice_objects.find_by_updated_at("2012-03-09 01:54:10 UTC").id
  end
end
