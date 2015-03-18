require_relative "merchant"
require_relative "finder"
require "bigdecimal"

class MerchantRepository

  include Finder

  attr_reader :merchants,
              :inspect,
              :sales_engine

  def initialize(data, sales_engine)
    @merchants     = data.map {|row| Merchant.new(row, self)}
    @sales_engine = sales_engine
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def all
    @all_merchants ||= merchants
  end

  def random
    merchants.sample
  end

  def find_by_name(name)
    find_by_string_parameter(merchants, :name, name)
  end

  def find_all_by_name(name)
    find_all_by_string_parameter(merchants, :name, name)
  end

  def find_by_id(id)
    find_by_parameter(merchants, :id, id)
  end

  def find_by_created_at(created_at)
    find_by_parameter(merchants, :created_at, created_at)
  end

  def find_all_by_created_at(created_at)
    find_all_by_parameter(merchants, :created_at, created_at )
  end

  def find_by_updated_at(updated_at)
    find_by_parameter(merchants, :updated_at, updated_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_by_string_parameter(merchants, :updated_at, updated_at)
  end

  def find_customer(customer_id)
    sales_engine.find_customer(customer_id)
  end

  def find_successful_invoices
    @successful_invoices ||= sales_engine.find_successful_invoices
  end

  def find_successful_invoice_items
    @successful_invoice_items ||= sales_engine.invoice_item_repository.all_successful_invoice_items
  end

  def all_items(merchant_id)
    sales_engine.find_items_sold_by_merchant(merchant_id)
  end

  def all_invoices(merchant_id)
    sales_engine.find_invoices_for_merchant(merchant_id)
  end

  def most_revenue(number)
    merchants.sort_by do |merchants|
      merchants.revenue
    end.reverse.take(number)
  end

  def most_items(number)
    merchants.max_by(number) do |merchants|
      merchants.total_items_sold
    end
  end

  def revenue(date)
    successful_invoices = sales_engine.invoice_repository.all_successful_invoices
    invoices_by_date = successful_invoices.find_all do |invoice|
      Date.parse(invoice.created_at.to_s) == Date.parse(date.to_s)
    end

    invoice_items = invoices_by_date.flat_map do |invoice|
      invoice.invoice_items
    end

    invoice_items.reduce(0) do |sum, ii|
      sum + (ii.quantity * ii.unit_price) / 100.00
    end
  end

  # private

  # def all_invoices_across_all_merchants
  #   @all_invoices_across_all_merchants ||= merchants.flat_map {|merchant| all_invoices(merchant.id) }
  # end
end
