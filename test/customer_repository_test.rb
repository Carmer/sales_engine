require "./test/test_helper"
require "./lib/customer_repository"

class CustomerRepositortyTest < Minitest::Test

  def test_it_exists
    assert CustomerRepository
  end

  def test_it_creates_an_array_of_customer_objects
    customers_data = Parser.new.parse("sample_customers.csv")

    customers_array = CustomerRepository.new(customers_data).customers
    assert_equal 19, customers_array.size
    assert_equal Array, customers_array.class
  end
end
