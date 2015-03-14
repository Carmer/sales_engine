require "./test/test_helper"
require "./lib/item_repository"

class ItemRepositoryTest < Minitest::Test

  def setup
    @item_data = Parser.new.parse("./data/", "sample_items.csv")
  end

  def test_it_exists
    assert ItemRepository
  end

  def test_it_creates_an_array_of_item_objects
    items = ItemRepository.new(@item_data, nil).items
    assert_equal 10, items.size
    assert_equal Array, items.class
  end

  def test_it_has_an_all_method
    items = ItemRepository.new(@item_data, nil)
    assert_equal 10, items.all.size
    assert_equal Array, items.all.class
  end

  def test_it_has_a_random_method
    items = ItemRepository.new(@item_data, nil)
    assert_equal Item, items.random.class
  end


  def test_it_creates_an_array_of_item_objects
    items = ItemRepository.new(@item_data, nil).items
    assert_equal 10, items.size
    assert_equal Array, items.class
  end

  def test_it_can_find_an_item_by_id
    items = ItemRepository.new(@item_data, nil)
    assert_equal "Item Qui Esse", items.find_by_id("1").name
  end

  def test_it_can_find_another_item_by_id
    items = ItemRepository.new(@item_data, nil)
    assert_equal "Item Ea Voluptatum", items.find_by_id("3").name
  end

  def test_it_can_find_an_item_by_description
    items = ItemRepository.new(@item_data, nil)
    assert_equal "Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.", items.find_by_description("Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.").description
  end

  def test_it_can_find_an_item_by_a_case_insensitive_description
    items = ItemRepository.new(@item_data, nil)
    assert_equal "Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.", items.find_by_description("Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet ODIT perspiciatis. Odio optio nisi rerum NIHIL ut.").description
  end

  def test_it_can_find_another_item_by_a_case_insensitive_description
    items = ItemRepository.new(@item_data, nil)
    assert_equal "Fuga assumenda occaecati hic dolorem tenetur dolores nisi. Est tenetur adipisci voluptatem vel. Culpa adipisci consequatur illo. Necessitatibus quis quo velit sed repellendus ut amet.", items.find_by_description("Fuga assumenda occaecati hic dolorem tenetur dolores nisi. Est tenetur adipisci voluptatem vel. Culpa adipisci consequatur ILLO. Necessitatibus quis quo velit sed repellendus ut AMET.").description
  end

    
end
