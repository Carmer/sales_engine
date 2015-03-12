require_relative "customer"

class CustomerRepository

  def initialize(data)
    @data = data
  end

  def customers
    @data.map {|row| Customer.new(row)}
  end
end

c = CustomerRepository.new(Parser.new.parse("customers.csv"))

puts c.customers
