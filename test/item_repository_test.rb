require "./test/test_helper"
require "./lib/item_repository"
require "./lib/sales_engine"

class ItemRepositoryTest < Minitest::Test

  def setup
    @item_objects = SalesEngine.new.item_repository
  end

  def test_it_exists
    assert ItemRepository
  end

  def test_it_has_an_all_method
    assert_equal 595, @item_objects.all.size
    assert_equal Array, @item_objects.all.class
  end

  def test_it_can_find_a_random_item
    sample = []
    10.times {sample << @item_objects.random}
    assert sample.uniq
  end

  def test_it_can_inpsect_itself
    assert_equal "#<ItemRepository 595 rows>", @item_objects.inspect
  end

  def test_it_creates_an_array_of_item_objects
    assert_equal 595, @item_objects.items.size
    assert_equal Array, @item_objects.items.class
  end

  def test_it_can_find_an_item_by_id
    assert_equal "Item Qui Esse", @item_objects.find_by_id(1).name
  end

  def test_it_can_find_another_item_by_id
    assert_equal "Item Ea Voluptatum", @item_objects.find_by_id( 3).name
  end

  def test_it_can_find_an_item_by_description
    assert_equal "Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.", @item_objects.find_by_description("Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.").description
  end

  def test_it_can_find_an_item_by_a_case_insensitive_description
    assert_equal "Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.", @item_objects.find_by_description("Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet ODIT perspiciatis. Odio optio nisi rerum NIHIL ut.").description
  end

  def test_it_can_find_another_item_by_a_case_insensitive_description
    assert_equal "Fuga assumenda occaecati hic dolorem tenetur dolores nisi. Est tenetur adipisci voluptatem vel. Culpa adipisci consequatur illo. Necessitatibus quis quo velit sed repellendus ut amet.", @item_objects.find_by_description("Fuga assumenda occaecati hic dolorem tenetur dolores nisi. Est tenetur adipisci voluptatem vel. Culpa adipisci consequatur ILLO. Necessitatibus quis quo velit sed repellendus ut AMET.").description
  end

  def test_it_can_find_an_item_by_unit_price
    assert_equal "Item Provident At", @item_objects.find_by_unit_price(BigDecimal.new("15925") / 100).name
  end

  def test_it_can_find_an_item_by_merchant_id
    assert_equal "Item Qui Esse", @item_objects.find_by_merchant_id( 1).name
    refute_equal "Item Ea Voluptatum", @item_objects.find_by_merchant_id(1).name
  end

  def test_it_can_find_an_item_by_created_at
    assert_equal "Item Qui Esse", @item_objects.find_by_created_at("2012-03-27 14:53:59 UTC").name
  end

  def test_it_can_find_an_item_by_updated_at
    assert_equal "Item Qui Esse", @item_objects.find_by_updated_at("2012-03-27 14:53:59 UTC").name
  end

  def test_it_can_find_an_item_by_name
    assert_equal 3, @item_objects.find_by_name("Item Ea Voluptatum").id
  end

  def test_it_can_find_all_items_by_name
    assert_equal 1, @item_objects.find_all_by_name("Item Ea Voluptatum").size
  end

  def test_it_can_find_all_items_by_merchant_id
    assert_equal 15, @item_objects.find_all_by_merchant_id(1).size
  end

  def test_it_can_find_all_items_by_created_at
    assert_equal 170, @item_objects.find_all_by_created_at("2012-03-27 14:53:59 UTC").length
  end

  def test_it_can_find_all_items_by_updated_at
    assert_equal 170, @item_objects.find_all_by_updated_at("2012-03-27 14:53:59 UTC").length
  end

  def test_it_can_find_all_by_description
    assert_equal 1, @item_objects.find_all_by_description("Nostrum doloribus quia. Expedita vitae beatae cumque. Aut ut illo aut eum.").size
  end

  def test_it_can_find_all_by_unit_price
    assert_equal 1, @item_objects.find_all_by_unit_price(BigDecimal.new("59454") / 100 ).size
  end

  def test_it_returns_the_top_n_items_ranked_by_total_revenue_generated
    skip
    assert_equal [99,9,99], @item_objects.most_revenue(3)
  end
end
