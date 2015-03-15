require "./test/test_helper"
require "./lib/item"
require "./lib/sales_engine"

class TestItem < Minitest::Test
  def test_it_exists
    assert Item
  end

  def setup
    sales_engine = SalesEngine.new
    @item = sales_engine.item_repository.find_by_id("3")
  end

  def test_an_item_attributes
    assert_equal "Item Ea Voluptatum", @item.name
    assert_equal "3", @item.id
    assert_equal "Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.", @item.description
    assert_equal "32301", @item.unit_price
    assert_equal "1", @item.merchant_id
    assert_equal "2012-03-27 14:53:59 UTC", @item.created_at
    assert_equal "2012-03-27 14:53:59 UTC", @item.updated_at
  end

  def test_it_returns_a_collection_of_invoice_items
    assert_equal 10, @item.invoice_items.size
  end
end
