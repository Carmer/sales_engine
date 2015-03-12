require_relative "customer"

class CustomerRepository

  attr_reader :customers

  def initialize(data)
    @customers ||= data.map {|row| Customer.new(row)}
  end

  def all
    @customers
  end

  def random
    @customers.sample
  end

  def find_customer_by_first_name(f_name)
    @customers.find {|customer| customer.first_name.upcase == f_name.upcase}
  end

  def find_customer_by_last_name(l_name)
    @customers.find {|customer| customer.last_name.upcase == l_name.upcase}
  end

  def find_customer_by_created_at(created)
    @customers.find {|customer| customer.created_at == created}
  end
end


  #
  # c = CustomerRepository.new(Parser.new.parse("sample_customers.csv"))
  # puts c.find_customer_by_first_name("Joey")
