require "./test/test_helper"
require "./lib/customer_repository"

class CustomerRepositortyTest < Minitest::Test


  def setup
     custrepo = CustomerRepository.new([{:id=>"1", :name=>"Schroeder-Jerde", :created_at=>"2012-03-27 14:53:59 UTC", :updated_at=>"2012-03-27 14:53:59 UTC"},
     {:id=>"1", :name=>"Schroeder-Jerde", :created_at=>"2012-03-27 14:53:59 UTC", :updated_at=>"2012-03-27 14:53:59 UTC"}])
  end

  def test_it_exists
    assert CustomerRepository
  end
end
