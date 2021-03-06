require_relative "customer"
require_relative "finder"

class CustomerRepository
  include Finder

  attr_reader :customers,
              :sales_engine


  def initialize(data, sales_engine)
    @customers  ||= data.map { |row| Customer.new(row, self) }
    @sales_engine = sales_engine
  end

  def inspect
    "#<#{self.class} #{customers.size} rows>"
  end

  def all
    @customers ||= customers
  end

  def random
    customers.sample
  end

  def find_by_first_name(first_name)
    find_as_string(customers, :first_name, first_name)
  end

  def find_all_by_first_name(first_name)
    find_all_as_string(customers, :first_name, first_name)
  end

  def find_by_last_name(last_name)
    find_as_string(customers, :last_name, last_name)
  end

  def find_all_by_last_name(last_name)
    find_all_as_string(customers, :last_name, last_name)
  end

  def find_by_id(id)
    find_by(customers, :id, id)
  end

  def find_by_created_at(created_at)
    find_by(customers, :created_at, created_at)
  end

  def find_all_by_created_at(created_at)
    find_all_by(customers, :created_at, created_at)
  end

  def find_by_updated_at(updated_at)
    find_by(customers, :updated_at, updated_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_by(customers, :updated_at, updated_at)
  end

  def all_invoices(customer_id)
    sales_engine.all_customer_invoices(customer_id)
  end

  def merchant(merchant_id)
    sales_engine.merchant(merchant_id)
  end

  def successful_invoices
    @successful_invoices ||= sales_engine.successful_invoices
  end
end
