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
    assert_equal 101, @invoice_item_objects.invoice_items.size
    assert_equal Array, @invoice_item_objects.invoice_items.class
  end

  def test_it_can_select_at_random
    sample = []
    10.times {sample << @invoice_item_objects.random}
    assert sample.uniq
  end

  def test_it_can_find_all
    assert_equal 101, @invoice_item_objects.all.size
  end

  def test_it_can_inspec_itself
    assert_equal "#<InvoiceItemsRepository 101 rows>", @invoice_item_objects.inspect

  end

  def test_it_can_find_by_id
    assert_equal "539", @invoice_item_objects.find_by_id("1").item_id
    assert_equal "1830", @invoice_item_objects.find_by_id("10").item_id
  end

  def test_it_can_find_by_invoice_id
    assert_equal "539", @invoice_item_objects.find_by_invoice_id("1").item_id
    assert_equal "1832", @invoice_item_objects.find_by_invoice_id("2").item_id
  end

  def test_it_can_find_by_quantity
    assert_equal "535", @invoice_item_objects.find_by_quantity("3").item_id
  end

  def test_it_can_find_by_unit_price
    assert_equal "529", @invoice_item_objects.find_by_unit_price("79140").item_id
  end

  def test_it_can_find_by_created_at
    assert_equal "539", @invoice_item_objects.find_by_created_at("2012-03-27 14:54:09 UTC").item_id
  end

  def test_it_can_find_by_updated_at
    assert_equal "539", @invoice_item_objects.find_by_updated_at("2012-03-27 14:54:09 UTC").item_id
  end

  def test_it_can_find_all_by_id
    assert_equal 1, @invoice_item_objects.find_all_by_id("1").size
    assert_equal 1, @invoice_item_objects.find_all_by_id("10").size
  end

  def test_it_can_find_by_item_id
    assert_equal "4", @invoice_item_objects.find_by_item_id("535").id
  end

  def test_it_can_find_all_by_item_id
    assert_equal 1, @invoice_item_objects.find_all_by_item_id("535").size
  end

  def test_it_can_find_all_by_invoice_id
    assert_equal 8, @invoice_item_objects.find_all_by_invoice_id("1").size
    assert_equal 4, @invoice_item_objects.find_all_by_invoice_id("2").size
  end

  def test_it_can_find_all_by_quantity
    assert_equal 11, @invoice_item_objects.find_all_by_quantity("3").size
  end

  def test_it_can_find_all_by_unit_price
    assert_equal 1, @invoice_item_objects.find_all_by_unit_price("79140").size
  end

  def test_it_can_find_all_by_created_at
    assert_equal 15, @invoice_item_objects.find_all_by_created_at("2012-03-27 14:54:09 UTC").size
  end

  def test_it_can_find_all_by_updated_at
    assert_equal 15, @invoice_item_objects.find_all_by_updated_at("2012-03-27 14:54:09 UTC").size
  end
end
