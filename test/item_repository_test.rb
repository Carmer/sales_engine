require "./test/test_helper"
require "./lib/item_repository"

class ItemRepositortyTest < Minitest::Test

  def test_it_exists
    assert ItemRepository
    @item_data = Parser.new.parse("./data/", "sample_items.csv")
  end

  def test_it_creates_an_array_of_item_objects
    @item_data = ItemRepository.new(item_data).items
    assert_equal 10, item_data.size
    assert_equal Array, item_data.class
  end
end
