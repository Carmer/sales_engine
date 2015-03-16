require_relative "customer"
require_relative "finder"

class CustomerRepository

  include Finder

  attr_reader :customer,
              :sales_engine


  def initialize(data, sales_engine)
    @customer    = data.map {|row| Customer.new(row, self)}
    @sales_engine = sales_engine
  end

  def inspect
    "#<#{self.class} #{customer.size} rows>"
  end

  def all
    customer
  end

  def random
    customer.sample
  end

  def find_by_first_name(first_name)
    find_by_string_parameter(customer, :first_name, first_name)
  end

  def find_all_by_first_name(first_name)
    find_all_by_string_parameter(customer, :first_name, first_name)
  end

  def find_by_last_name(last_name)
    find_by_string_parameter(customer, :last_name, last_name)
  end

  def find_all_by_last_name(last_name)
    find_all_by_string_parameter(customer, :last_name, last_name)
  end

  def find_by_id(id)
    find_by_parameter(customer, :id, id)
  end

  def find_by_created_at(created_at)
    find_by_parameter(customer, :created_at, created_at)
  end

  def find_all_by_created_at(created_at)
    find_all_by_parameter(customer, :created_at, created_at)
  end

  def find_by_updated_at(updated_at)
    find_by_parameter(customer, :updated_at, updated_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_by_parameter(customer, :updated_at, updated_at)
  end

  def all_invoices(customer_id)
    sales_engine.all_customer_invoices(customer_id)
  end
end
