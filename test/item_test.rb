require "./test/test_helper"
require "./lib/item"

class TestItem < Minitest::Test
  def test_it_exists
    assert Item
  end

  def test_it_can_instantiate_an_item_object
    items = Parser.new.parse("items_sample.csv")
    data = items[0]

    item = Item.new(data)
    assert item
  end

  def test_an_item_has_a_name
    items = Parser.new.parse("items_sample.csv")
    data = items[0]

    item = Item.new(data)
    assert_equal "Item Qui Esse", item.name
  end

  def test_a_different_item_has_a_name
    items = Parser.new.parse("items_sample.csv")
    data = items[5]

    item = Item.new(data)
    assert_equal "Item Provident At", item.name
  end

  def test_an_item_has_an_id
    items = Parser.new.parse("items_sample.csv")
    data = items[0]

    item = Item.new(data)
    assert_equal "1", item.id
  end

  def test_a_different_item_has_an_id
    items = Parser.new.parse("items_sample.csv")
    data = items[5]

    item = Item.new(data)
    assert_equal "6", item.id
  end

  def test_an_item_has_a_description
    items = Parser.new.parse("items_sample.csv")
    data = items[7]

    item = Item.new(data)
    assert_equal "Reprehenderit est officiis cupiditate quia eos. Voluptatem illum reprehenderit quo vel eligendi. Et eum omnis id ut aliquid veniam.", item.description
  end

  def test_a_different_item_has_a_description
    items = Parser.new.parse("items_sample.csv")
    data = items[8]

    item = Item.new(data)
    assert_equal "Culpa deleniti adipisci voluptates aut. Sed eum quisquam nisi. Voluptatem est rerum est qui id reprehenderit. Molestiae laudantium non velit alias. Ipsa consequatur modi quibusdam.", item.description
  end

  def test_an_item_has_a_unit_price
    items = Parser.new.parse("items_sample.csv")
    data = items[0]

    item = Item.new(data)
    assert_equal "75107", item.unit_price
  end

  def test_a_different_item_has_a_unit_price
    items = Parser.new.parse("items_sample.csv")
    data = items[2]

    item = Item.new(data)
    assert_equal "32301", item.unit_price
  end

  def test_an_item_has_a_merchant_id
    items = Parser.new.parse("items_sample.csv")
    data = items[7]

    item = Item.new(data)
    assert_equal "1", item.merchant_id
  end

  def test_a_different_item_has_a_merchant_id
    items = Parser.new.parse("items_sample.csv")
    data = items[2]

    item = Item.new(data)
    assert_equal "1", item.merchant_id
  end

  def test_an_item_has_a_created_at
    items = Parser.new.parse("items_sample.csv")
    data = items[2]

    item = Item.new(data)
    assert_equal "2012-03-27 14:53:59 UTC", item.created_at
  end

  def test_a_different_item_has_a_created_at
    items = Parser.new.parse("items_sample.csv")
    data = items[3]

    item = Item.new(data)
    assert_equal "2012-03-27 14:53:59 UTC", item.created_at
  end

  def test_an_item_has_an_updated_at
    items = Parser.new.parse("items_sample.csv")
    data = items[6]

    item = Item.new(data)
    assert_equal "2012-03-27 14:53:59 UTC", item.updated_at
  end

  def test_a_different_item_has_an_updated_at
    items = Parser.new.parse("items_sample.csv")
    data = items[9]

    item = Item.new(data)
    assert_equal "2012-03-27 14:53:59 UTC", item.updated_at    
  end
end
