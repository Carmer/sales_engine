require "./test/test_helper"
require "./lib/invoice_items_repository"

class InvoiceItemsRepositortyTest < Minitest::Test

  def test_it_exists
    assert InvoiceItemsRepository
  end

  def test_it_creates_an_array_of_invoice_items_objects
    invoice_item_data = Parser.new.parse("./data", "sample_invoice_items.csv")

    invoice_items_array = InvoiceItemsRepository.new(invoice_item_data, nil).invoice_items
    assert_equal 19, invoice_items_array.size
    assert_equal Array, invoice_items_array.class
  end
end
