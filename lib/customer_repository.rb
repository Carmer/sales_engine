require_relative "customer"
require_relative "finder"

class CustomerRepository

  include Finder

  attr_reader :customers


  def initialize(data, sales_engine)
    @customers  ||= data.map {|row| Customer.new(row, self)}
    @sales_engine = sales_engine
  end

  def inspect
    "#<#{self.class} #{customers.size} rows>"
  end

  def all
    customers
  end

  def random
    customers.sample
  end

  def find_by_first_name(first_name)
    find_by_string_parameter(customers, :first_name, first_name)
  end

  def find_all_by_first_name(first_name)
    find_all_by_string_parameter(customers, :first_name, first_name)
  end

  def find_by_last_name(last_name)
    find_by_string_parameter(customers, :last_name, last_name)
  end

  def find_all_by_last_name(last)name
    find_all_by_string_parameter(customers, :last_name, last_name)
  end

  def find_by_id(id)
    find_by_parameter(customers, :id, id)
  end

  def find_customers_by_created_at(created_at)
    find_all_by_parameter(customers, :created_at, created_at)
  end

  def find_all_customers_by_created_at(created_at)
    find_all_by_parameter(customers, :created_at, created_at)
  end

  def find_customers_by_updated_at(updated_at)
    find_all_by_parameter(customers, :updated_at, updated_at)
  end

  def find_all_customers_by_updated_at(updated_at)
    find_all_by_parameter(customers, :updated_at, updated_at)
  end
end
