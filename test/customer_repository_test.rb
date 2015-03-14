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

  def test_it_can_find_all_customers
    cust = CustomerRepository.new(@customers_data, nil)
    result = cust.all
    assert_equal 19, result.size
  end

  def test_it_can_inspect_itself
    cust = CustomerRepository.new(@customers_data, nil).inspect
    assert_equal "#<CustomerRepository 19 rows>", cust
  end

  def test_it_can_find_by_id
    cust = CustomerRepository.new(@customers_data, nil)
    result = cust.find_by_id("3")
    assert_equal "3", result.id
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

  def test_it_can_search_for_a_customer_by_first_name_in_all_lowercaed_letters
    cust = CustomerRepository.new(@customers_data, nil)
    result = cust.find_by_first_name("joey")
    assert_equal "Joey", result.first_name
  end

  def test_it_can_search_for_a_customer_by_first_name_in_mixedcased_letters
    cust = CustomerRepository.new(@customers_data, nil)
    result = cust.find_by_first_name("jOeY")
    assert_equal "Joey", result.first_name
  end

  def test_it_can_search_for_all_customers_by_first_name
    cust = CustomerRepository.new(@customers_data, nil)
    result = cust.find_all_by_first_name("Joey")
    assert_equal 1, result.size
  end

  def test_it_can_search_for_a_customer_by_first_name_in_mixed_case_letters
    cust = CustomerRepository.new(@customers_data, nil)
    result = cust.find_all_by_first_name("JoEy")
    assert_equal 1, result.size
    assert_equal "Joey", result[0].first_name
  end

  def test_it_can_search_for_all_customers_by_last_name
    cust = CustomerRepository.new(@customers_data, nil)
    result = cust.find_all_by_last_name("Hettinger")
    assert_equal "Hettinger", result[0].last_name
    assert_equal 1, result.size
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

  def test_it_can_find_all_customers_by_created_at
    cust = CustomerRepository.new(@customers_data, nil)
    assert_equal 6, cust.find_all_by_created_at("2012-03-27 14:54:10 UTC").length
  end

  def test_it_can_find_all_customers_by_updated_at
    cust = CustomerRepository.new(@customers_data, nil)
    assert_equal 6, cust.find_all_by_updated_at("2012-03-27 14:54:10 UTC").length
  end

  def test_it_can_find_a_customer_by_created_at
    cust = CustomerRepository.new(@customers_data, nil)
    assert_equal "2", cust.find_by_created_at("2012-03-27 14:54:10 UTC").id
  end

  def test_it_can_find_a_customer_by_updated_at
    cust = CustomerRepository.new(@customers_data, nil)
    assert_equal "2", cust.find_by_updated_at("2012-03-27 14:54:10 UTC").id
  end
end
