require_relative "invoice"
require_relative "finder"

class InvoiceRepository

  include Finder

  attr_reader :invoice,
              :sales_engine

  def initialize(data, sales_engine)
    @invoice     = data.map {|row| Invoice.new(row, self)}
    @sales_engine = sales_engine
  end

  def inspect
    "#<#{self.class} #{@invoice.size} rows>"
  end

  def random
    @invoice.sample
  end

  def find_by_id(id)
    find_by_parameter(invoice, :id, id)
  end

  def find_by_status(status)
    find_by_string_parameter(invoice, :status, status)
  end

  def find_all_by_status(status)
    find_all_by_string_parameter(invoice, :status, status)
  end

  def find_by_customer_id(customer_id)
    find_by_parameter(invoice, :customer_id, customer_id)
  end

  def find_all_by_customer_id(customer_id)
    find_all_by_parameter(invoice, :customer_id, customer_id)
  end

  def find_by_merchant_id(merchant_id)
    find_by_parameter(invoice, :merchant_id, merchant_id)
  end

  def find_all_by_merchant_id(merchant_id)
    find_all_by_parameter(invoice, :merchant_id, merchant_id)
  end

  def find_by_created_at(created_at)
    find_by_parameter(invoice, :created_at, created_at)
  end

  def find_all_by_created_at(created_at)
    find_all_by_parameter(invoice, :created_at, created_at)
  end

  def find_by_updated_at(updated_at)
    find_by_parameter(invoice, :updated_at, updated_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_by_parameter(invoice, :updated_at, updated_at)
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
    @successful_transactions ||= sales_engine.transaction_repository.find_all_successful_transactions
    @successful_invoices ||= invoice.select do |invoice|
      @successful_transactions.any?  do |transaction|
        transaction.invoice_id == invoice.id
      end
    end
  end

  
end
