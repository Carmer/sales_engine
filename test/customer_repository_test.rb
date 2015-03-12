require "./test/test_helper"
require_relative "customer_repository"

class CustomerRepositortyTest < Minitest::Test

  def test_it_exists
    assert CustomerRepository
  end

  def test_it_creates_an_array_of_customer_objects
    customers_data = Parser.new.parse("customers.csv")

    customers_array = CustomerRepository.new(customers_data).customers
    assert_equal 1000, customers_array.size
    assert_equal Array, customers_array.class
  end
end
