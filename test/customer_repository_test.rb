require "./test/test_helper"
require "./lib/customer_repository"
require "./lib/sales_engine"

class CustomerRepositortyTest < Minitest::Test

  def test_it_exists
    assert CustomerRepository
  end

  def setup
    @customer = SalesEngine.new.customer_repository
  end

  def test_it_creates_an_array_of_customer_objects
    assert_equal 99, @customer.customer.size
    assert_equal Array, @customer.customer.class
  end

  def test_it_can_pull_a_random_sample_customer
    sample = []
    10.times {sample << @customer.random}
    assert sample.uniq
  end

  def test_it_can_find_all_customers
    assert_equal 99, @customer.all.size
  end

  def test_it_can_inspect_itself
    assert_equal "#<CustomerRepository 99 rows>", @customer.inspect
  end

  def test_it_can_find_by_id
    result = @customer.find_by_id("3")
    assert_equal "3", result.id
  end

  def test_it_can_search_for_a_customer_by_first_name
    result = @customer.find_by_first_name("Joey")
    assert_equal "Joey", result.first_name
  end

  def test_it_can_search_for_a_customer_by_first_name_in_all_capital_letters
    result = @customer.find_by_first_name("JOEY")
    assert_equal "Joey", result.first_name
  end

  def test_it_can_search_for_a_customer_by_first_name_in_all_lowercaed_letters
    result = @customer.find_by_first_name("joey")
    assert_equal "Joey", result.first_name
  end

  def test_it_can_search_for_a_customer_by_first_name_in_mixedcased_letters
    result = @customer.find_by_first_name("jOeY")
    assert_equal "Joey", result.first_name
  end

  def test_it_can_search_for_all_customers_by_first_name
    result = @customer.find_all_by_first_name("Joey")
    assert_equal 1, result.size
  end

  def test_it_can_search_for_a_customer_by_first_name_in_mixed_case_letters
    result = @customer.find_all_by_first_name("JoEy")
    assert_equal 1, result.size
    assert_equal "Joey", result[0].first_name
  end

  def test_it_can_search_for_all_customers_by_last_name
    result = @customer.find_all_by_last_name("Hettinger")
    assert_equal "Hettinger", result[0].last_name
    assert_equal 2, result.size
  end

  def test_it_can_search_for_customer_by_last_name
    result = @customer.find_by_last_name("Hettinger")
    assert_equal "Hettinger", result.last_name
  end

  def test_it_can_search_for_customer_by_last_name_in_all_capital_letters
    result = @customer.find_by_last_name("HETTINGER")
    assert_equal "Hettinger", result.last_name
  end

  def test_it_can_search_for_customer_by_last_name_in_all_lowercase_letters
    result = @customer.find_by_last_name("hettinger")
    assert_equal "Hettinger", result.last_name
  end

  def test_it_can_search_for_customer_by_last_name_in_mixedcase_letters
    result = @customer.find_by_last_name("heTTingEr")
    assert_equal "Hettinger", result.last_name
  end

  def test_it_can_find_all_customers_by_created_at
    assert_equal 6, @customer.find_all_by_created_at("2012-03-27 14:54:10 UTC").length
  end

  def test_it_can_find_all_customers_by_updated_at
    assert_equal 6, @customer.find_all_by_updated_at("2012-03-27 14:54:10 UTC").length
  end

  def test_it_can_find_a_customer_by_created_at
    assert_equal "2", @customer.find_by_created_at("2012-03-27 14:54:10 UTC").id
  end

  def test_it_can_find_a_customer_by_updated_at
    assert_equal "2", @customer.find_by_updated_at("2012-03-27 14:54:10 UTC").id
  end
end
