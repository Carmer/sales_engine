require "./test/test_helper"
require "./lib/item_repository"

class ItemRepositortyTest < Minitest::Test

  def test_it_exists
    assert ItemRepository
  end

  def setup
    @item_data = Parser.new.parse("./data", "sample_items.csv")
  end

  def test_it_creates_an_array_of_item_objects
    item = ItemRepository.new(@item_data, nil).items
    assert_equal 10, item.size
    assert_equal Array, item.class
  end
end
