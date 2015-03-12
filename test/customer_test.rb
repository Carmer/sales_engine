require './test/test_helper'
require './lib/customer'

class CustomerTest < Minitest::Test

  def test_it_exists
    cust = Customer.new([{:id=>"1", :name=>"Schroeder-Jerde", :created_at=>"2012-03-27 14:53:59 UTC", :updated_at=>"2012-03-27 14:53:59 UTC"}])
  end

  def setup
    @cust = Customer.new([{:id=>"1", :name=>"Schroeder-Jerde", :created_at=>"2012-03-27 14:53:59 UTC", :updated_at=>"2012-03-27 14:53:59 UTC"}])
  end

  def test_it_has_customer_id
    assert_equal "1", @cust.id
  end

  def test_there_is_a_first_name_for_customer
    assert_equal "schroeder-Jerde", @cust.first_name
  end

  def test_there_is_a_last_name_for_customer
    assert_equal ["Ondricka"], @cust.last_name
  end

  def test_there_is_an_entry_for_creation_of

  end

end
