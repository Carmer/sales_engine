require "./test/test_helper"
require "./lib/customer_repository"

class CustomerRepositortyTest < Minitest::Test

  def test_it_exists
    assert custrepo = CustomerRepository.new([{:id=>"1", :name=>"Schroeder-Jerde", :created_at=>"2012-03-27 14:53:59 UTC", :updated_at=>"2012-03-27 14:53:59 UTC"},
     {:id=>"1", :name=>"Schroeder-Jerde", :created_at=>"2012-03-27 14:53:59 UTC", :updated_at=>"2012-03-27 14:53:59 UTC"}])
  end

  def setup
    assert custrepo = CustomerRepository.new([{:id=>"1", :name=>"Schroeder-Jerde", :created_at=>"2012-03-27 14:53:59 UTC", :updated_at=>"2012-03-27 14:53:59 UTC"},
     {:id=>"1", :name=>"Schroeder-Jerde", :created_at=>"2012-03-27 14:53:59 UTC", :updated_at=>"2012-03-27 14:53:59 UTC"}])
  end
end
