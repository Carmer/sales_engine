require "./test/test_helper"
require "./lib/item_repository"

class ItemRepositoryTest < Minitest::Test

  def setup
    @item_data = Parser.new.parse("./data/", "sample_items.csv")
  end

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

  def test_it_has_an_all_method
    item_data = ItemRepository.new(@item_data)
    assert_equal 10, item_data.all.size
    assert_equal Array, item_data.all.class
  end

  def test_it_has_a_random_method
    item_data = ItemRepository.new(@item_data)
    assert_equal Item, item_data.random.class
  end


end
