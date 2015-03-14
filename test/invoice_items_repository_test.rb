require "./test/test_helper"
require "./lib/invoice_items_repository"

class InvoiceItemsRepositortyTest < Minitest::Test

  def setup
    @invoice_item_data = Parser.new.parse("./data", "sample_invoice_items.csv")
  end

  def test_it_exists
    assert InvoiceItemsRepository
  end

  def test_it_creates_an_array_of_invoice_items_objects
    invoice_items_array = InvoiceItemsRepository.new(@invoice_item_data, nil).invoice_items
    assert_equal 19, invoice_items_array.size
    assert_equal Array, invoice_items_array.class
  end

  def test_it_finds_an_item_by_id
    invoice_items = InvoiceItemsRepository.new(@invoice_item_data, nil)
    assert_equal "539", invoice_items.find_by_id("1").item_id
    assert_equal "1830", invoice_items.find_by_id("10").item_id
  end

  def test_it_finds_an_item_by_invoice_id
    invoice_items = InvoiceItemsRepository.new(@invoice_item_data, nil)
    assert_equal "539", invoice_items.find_by_invoice_id("1").item_id
    assert_equal "1832", invoice_items.find_by_invoice_id("2").item_id
  end

  def test_it_finds_an_item_by_item_id
    
  end
end
