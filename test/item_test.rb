require "./test/test_helper"
require "./lib/item"
require "./lib/sales_engine"

class TestItem < Minitest::Test
  def test_it_exists
    assert Item
  end

  def setup
    sales_engine = SalesEngine.new
    @item = sales_engine.item_repository.find_by_id("227")
  end

  def test_an_item_attributes
    assert_equal "Item Dicta Autem", @item.name
    assert_equal "227", @item.id
    assert_equal "Fugiat est ut eum impedit vel et. Deleniti quia debitis similique. Sint atque explicabo similique est. Iste fugit quis voluptas. Rerum ut harum sed fugiat eveniet ullam ut.", @item.description
    assert_equal "85319", @item.unit_price
    assert_equal "14", @item.merchant_id
    assert_equal "2012-03-27 14:54:00 UTC", @item.created_at
    assert_equal "2012-03-27 14:54:00 UTC", @item.updated_at
  end

  def test_it_returns_a_collection_of_invoice_items
    assert_equal 4, @item.invoice_items.size
  end

  def test_it_returns_an_instance_of_merchant_associated_with_the_item
    assert_equal "14", @item.merchant.id
    assert_equal "Dicki-Bednar", @item.merchant.name
  end
end
