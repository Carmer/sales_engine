require "./test/test_helper"
require "./lib/customer_repository"

class CustomerRepositortyTest < Minitest::Test

  def test_it_exists
    assert CustomerRepository
  end

  def setup
    @customers_data = Parser.new.parse("./data","sample_customers.csv")
  end

  def test_it_creates_an_array_of_customer_objects
    cust = CustomerRepository.new(@customers_data, nil).customers
    assert_equal 19, cust.size
    assert_equal Array, cust.class
  end

  def test_it_can_pull_a_random_sample_customer
    cust = CustomerRepository.new(@customers_data, nil)
    sample = []
    10.times {sample << cust.random}
    assert sample.uniq
  end

  def test_it_can_search_for_a_customer_by_first_name
    cust = CustomerRepository.new(@customers_data, nil)
    result = cust.find_by_first_name("Joey")
    assert_equal "Joey", result.first_name
  end

  def test_it_can_search_for_a_customer_by_first_name_in_all_capital_letters
    cust = CustomerRepository.new(@customers_data, nil)
    result = cust.find_by_first_name("JOEY")
    assert_equal "Joey", result.first_name
  end

  def test_it_can_search_fro_a_customer_by_first_name_in_all_lowercaed_letters
    cust = CustomerRepository.new(@customers_data, nil)
    result = cust.find_by_first_name("joey")
    assert_equal "Joey", result.first_name
  end

  def test_it_can_search_fro_a_customer_by_first_name_in_mixedcased_letters
    cust = CustomerRepository.new(@customers_data, nil)
    result = cust.find_by_first_name("jOeY")
    assert_equal "Joey", result.first_name
  end

  def test_it_can_search_for_customer_by_last_name
    cust = CustomerRepository.new(@customers_data, nil)
    result = cust.find_by_last_name("Hettinger")
    assert_equal "Hettinger", result.last_name
  end

  def test_it_can_search_for_customer_by_last_name_in_all_capital_letters
    cust = CustomerRepository.new(@customers_data, nil)
    result = cust.find_by_last_name("HETTINGER")
    assert_equal "Hettinger", result.last_name
  end

  def test_it_can_search_for_customer_by_last_name_in_all_lowercase_letters
    cust = CustomerRepository.new(@customers_data, nil)
    result = cust.find_by_last_name("hettinger")
    assert_equal "Hettinger", result.last_name
  end

  def test_it_can_search_for_customer_by_last_name_in_mixedcase_letters
    cust = CustomerRepository.new(@customers_data, nil)
    result = cust.find_by_last_name("heTTingEr")
    assert_equal "Hettinger", result.last_name
  end
end
