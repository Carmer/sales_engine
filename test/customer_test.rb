require "./test/test_helper"
require "./lib/customer"

class CustomerTest < Minitest::Test

  def test_it_exists
    sample_customers = Customer
  end

  def setup
    @customers = Parser.new.parse("./data", "sample_customers.csv")
  end

  def test_it_can_instantiate_a_customer_object
    data = @customers[0]
    customer = Customer.new(data, nil)
    assert customer
  end

  def test_it_has_customer_id
    data = @customers[0]
    cust = Customer.new(data, nil)
    assert_equal "1", cust.id
  end

  def test_there_is_a_first_name_for_customer
    data = @customers[0]
    cust = Customer.new(data, nil)
    assert_equal "Joey", cust.first_name
  end

  def test_there_is_a_last_name_for_customer
    data = @customers[0]
    cust = Customer.new(data, nil)
    assert_equal "Ondricka", cust.last_name
  end

  def test_there_is_a_created_at_date
    data = @customers[0]
    cust = Customer.new(data, nil)
    assert_equal "2012-03-27 14:54:09 UTC", cust.created_at
  end

  def test_there_is_an_updated_date
    data = @customers[0]
    cust = Customer.new(data, nil)
    assert_equal "2012-03-27 14:54:09 UTC", cust.updated_at
  end

  def test_it_can_check_another_customer_id
    data = @customers[5]
    cust = Customer.new(data, nil)
    assert_equal "6", cust.id
  end

  def test_it_can_find_a_different_user_first_and_last_name
    data = @customers[7]
    cust = Customer.new(data, nil)
    assert_equal "Loyal", cust.first_name
    assert_equal "Considine", cust.last_name
  end
end
