require "./test/test_helper"
require "./lib/invoice_items_repository"
require "./lib/sales_engine"

class InvoiceItemsRepositortyTest < Minitest::Test

  def setup
    @invoice_item_objects = SalesEngine.new.invoice_items_repository
  end

  def test_it_exists
    assert InvoiceItemsRepository
  end

  def test_it_creates_an_array_of_invoice_items_objects
    assert_equal 19, @invoice_item_objects.invoice_items.size
    assert_equal Array, @invoice_item_objects.invoice_items.class
  end

  def test_it_finds_an_item_by_id
    assert_equal "539", @invoice_item_objects.find_by_id("1").item_id
    assert_equal "1830", @invoice_item_objects.find_by_id("10").item_id
  end

  def test_it_finds_an_item_by_invoice_id
    assert_equal "539", @invoice_item_objects.find_by_invoice_id("1").item_id
    assert_equal "1832", @invoice_item_objects.find_by_invoice_id("2").item_id
  end

  def test_it_finds_an_item_by_item_id

  end
end
