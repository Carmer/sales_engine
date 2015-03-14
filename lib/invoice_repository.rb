require_relative "invoice"

class InvoiceRepository

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

  def find_invoice_by_customer_id(customer_id)
    find_by_parameter(invoices, :cust_id, customer_id)
  end

  def find_all_invoices_by_customer_id(customer_id)
    find_all_by_parameter(invoices, :cust_id, customer_id)
  end

  def find_invoice_by_merchant_id(merchant_id)
    find_by_parameter(invoices, :cust_id, merchant_id)
  end

  def find_all_invoices_by_merchant_id(merchant_id)
    find_all_by_parameter(invoices, :cust_id, merchant_id)
  end

  def find_invoice_by_created_at(created_at)
    find_all_by_parameter(invoices, :created_at, created_at)
  end

  def find_all_invoice_by_created_at(created_at)
    find_all_by_parameter(invoices, :created_at, created_at)
  end

  def find_invoice_by_updated_at(updated_at)
    find_all_by_parameter(invoices, :updated_at, updated_at)
  end

  def find_all_invoice_by_updated_at(updated_at)
    find_all_by_parameter(invoices, :updated_at, updated_at)
  end
end
