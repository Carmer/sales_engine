require './test/test_helper'
require './lib/customer'

class CustomerTest < Minitest::Test

  def test_it_exists
    sample_customers = Customer
  end

  def test_it_can_instantiate_a_customer_object
    customers = Parser.new.parse("sample_customers.csv")
    @data = customers[0]

    customer = Customer.new(@data)
    assert customer
  end

  def test_it_has_customer_id
    customer = Parser.new.parse("sample_customers.csv")
    @data = customer[0]

    customer = Customer.new(@data)
    assert_equal "1", customer.id
  end

  def test_there_is_a_first_name_for_customer
    customer = Parser.new.parse("sample_customers.csv")
    @data = customer[0]

    customer = Customer.new(@data)
    assert_equal "Joey", customer.first_name
  end

  def test_there_is_a_last_name_for_customer
    customer = Parser.new.parse("sample_customers.csv")
    @data = customer[0]

    customer = Customer.new(@data)
    assert_equal "Ondricka", customer.last_name
  end

  def test_there_is_a_created_at_date
    customer = Parser.new.parse("sample_customers.csv")
    @data = customer[0]

    customer = Customer.new(@data)
    assert_equal "2012-03-27 14:54:09 UTC", customer.created_at
  end

  def test_there_is_an_updated_date
    customer = Parser.new.parse("sample_customers.csv")
    @data = customer[0]

    customer = Customer.new(@data)
    assert_equal "2012-03-27 14:54:09 UTC", customer.updated_at
  end

  def test_it_can_check_another_customer_id
    customer = Parser.new.parse("sample_customers.csv")
    @data = customer[5]

    customer = Customer.new(@data)
    assert_equal "6", customer.id
  end

  def test_it_can_find_a_different_user_first_and_last_name
    customer = Parser.new.parse("sample_customers.csv")
    @data = customer[7]

    customer = Customer.new(@data)
    assert_equal "Loyal", customer.first_name
    assert_equal "Considine", customer.last_name
  end
end
