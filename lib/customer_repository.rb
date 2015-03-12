require_relative "customer"

class CustomerRepository

  def initialize(data)
    @data = data
  end

  def load_data
    @data.map {|row| Customer.new(row)}
  end
end

c = CustomerRepository.new([{:id=>"1", :name=>"Schroeder-Jerde", :created_at=>"2012-03-27 14:53:59 UTC", :updated_at=>"2012-03-27 14:53:59 UTC"},
 {:id=>"1", :name=>"Schroeder-Jerde", :created_at=>"2012-03-27 14:53:59 UTC", :updated_at=>"2012-03-27 14:53:59 UTC"}])

c.load_data
