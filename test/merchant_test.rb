require "./test/test_helper"
require "./lib/merchant"

class TestMerchant < Minitest::Test

  def test_it_exists
    assert Merchant
  end

  def setup
    @merchants = Parser.new.parse("./data/", "sample_merchants.csv")
  end

  def test_it_can_instantiate_a_merchant_object
    assert @merchants
  end

  def test_a_merchant_has_a_name
    data = @merchants[0]

    merchant = Merchant.new(data)
    assert_equal "Schroeder-Jerde", merchant.name
  end

  def test_a_merchant_has_an_id
    data = @merchants[0]

    merchant = Merchant.new(data)
    assert_equal "1", merchant.id
  end

  def test_a_merchant_has_a_created_at
    data = @merchants[0]

    merchant = Merchant.new(data)
    assert_equal "2012-03-27 14:53:59 UTC", merchant.created_at
  end

  def test_a_merchant_has_an_updated_at
    data = @merchants[0]

    merchant = Merchant.new(data)
    assert_equal "2012-03-27 14:53:59 UTC", merchant.updated_at
  end


  def test_another_merchant_has_a_name
    data = @merchants[8]

    merchant = Merchant.new(data)
    assert_equal "Hand-Spencer", merchant.name
  end

  def test_another_merchant_has_an_id
    data = @merchants[8]

    merchant = Merchant.new(data)
    assert_equal "9", merchant.id
  end

  def test_another_merchant_has_a_created_at
    data = @merchants[8]

    merchant = Merchant.new(data)
    assert_equal "2012-03-27 14:53:59 UTC", merchant.created_at
  end

  def test_another_merchant_has_an_updated_at
    data = @merchants[8]

    merchant = Merchant.new(data)
    assert_equal "2012-03-27 14:53:59 UTC", merchant.updated_at
  end

end
