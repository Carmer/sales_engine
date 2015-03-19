require_relative "invoice"
require_relative "finder"

class InvoiceRepository

  include Finder

  attr_reader :invoices,
              :sales_engine

  def initialize(data, sales_engine)
    @invoices     = data.map {|row| Invoice.new(row, self)}
    @sales_engine = sales_engine

  end

  def create(inputs)

    data = {

      id:           next_id,
      customer_id:  inputs[:customer].id,
      merchant_id:  inputs[:merchant].id,
      status:       "shipped",
      created_at:   Time.now.to_s,
      updated_at:   Time.now.to_s
  }

    invoice = Invoice.new(data, self)

    @invoices << invoice

    invoice.add_items(inputs[:items], invoice.id)
    invoice
  end

  def next_id
    invoices.last.id + 1
  end

  def charge(data, id)
    sales_engine.charge(data, id)
  end

  def inspect
    "#<#{self.class} #{@invoices.size} rows>"
  end

  def random
    @invoices.sample
  end

  def find_by_id(id)
    find_by_parameter(invoices, :id, id)
  end

  def find_by_status(status)
    find_by_string_parameter(invoices, :status, status)
  end

  def find_all_by_status(status)
    find_all_by_string_parameter(invoices, :status, status)
  end

  def find_by_customer_id(customer_id)
    find_by_parameter(invoices, :customer_id, customer_id)
  end

  def find_all_by_customer_id(customer_id)
    find_all_by_parameter(invoices, :customer_id, customer_id)
  end

  def find_by_merchant_id(merchant_id)
    find_by_parameter(invoices, :merchant_id, merchant_id)
  end

  def find_all_by_merchant_id(merchant_id)
    find_all_by_parameter(invoices, :merchant_id, merchant_id)
  end

  def find_by_created_at(created_at)
    find_by_parameter(invoices, :created_at, created_at)
  end

  def find_all_by_created_at(created_at)
    find_all_by_parameter(invoices, :created_at, created_at)
  end

  def find_by_updated_at(updated_at)
    find_by_parameter(invoices, :updated_at, updated_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_by_parameter(invoices, :updated_at, updated_at)
  end

  def all_transactions(invoice_id)
    sales_engine.find_all_transactions_for_invoice(invoice_id)
  end

  def all_invoice_items(invoice_id)
    sales_engine.find_all_invoice_items(invoice_id)
  end

  def customer_instance(customer_id)
    sales_engine.find_customer(customer_id)
  end

  def merchant_instance(merchant_id)
    sales_engine.find_merchant(merchant_id)
  end

  def find_item(item_id)
    sales_engine.find_item(item_id)
  end

  def all_successful_invoices
    @successful_transactions ||= sales_engine.find_all_successful_transactions
    @successful_invoices ||= invoices.select do |invoice|
      @successful_transactions.any?  do |transaction|
        transaction.invoice_id == invoice.id
      end
    end
  end
end
