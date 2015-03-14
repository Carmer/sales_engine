require_relative "invoice"
require_relative "finder"

class InvoiceRepository

  include Finder

  attr_reader :invoices

  def initialize(data, sales_engine)
    @invoices      = data.map {|row| Invoice.new(row)}
    @sales_engine = sales_engine
  end

  def inspect
    "#<#{self.class} #{@items.size} rows>"
  end

  def random
    @invoices.random
  end

  def find_by_id(id)
    find_by_parameter(invoices, :id, id)
  end

  def find_by_status(status)
    find_by_string_parameter(invoices, :status, status)
  end

  def find_all_by_status
    find_all_by_string_parameter(invoices, :status, status)
  end

  def find_by_customer_id(customer_id)
    find_by_parameter(invoices, :cust_id, customer_id)
  end

  def find_all_by_customer_id(customer_id)
    find_all_by_parameter(invoices, :cust_id, customer_id)
  end

  def find_by_merchant_id(merchant_id)
    find_by_parameter(invoices, :cust_id, merchant_id)
  end

  def find_all_by_merchant_id(merchant_id)
    find_all_by_parameter(invoices, :cust_id, merchant_id)
  end

  def find_by_created_at(created_at)
    find_all_by_parameter(invoices, :created_at, created_at)
  end

  def find_all_by_created_at(created_at)
    find_all_by_parameter(invoices, :created_at, created_at)
  end

  def find_by_updated_at(updated_at)
    find_all_by_parameter(invoices, :updated_at, updated_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_by_parameter(invoices, :updated_at, updated_at)
  end
end
