require_relative "merchant"
require_relative "finder"
require "bigdecimal"

class MerchantRepository

  include Finder

  attr_reader :merchant,
              :inspect,
              :sales_engine

  def initialize(data, sales_engine)
    @merchant     = data.map {|row| Merchant.new(row, self)}
    @sales_engine = sales_engine
  end

  def inspect
    "#<#{self.class} #{@merchant.size} rows>"
  end

  def all
    @all_merchants ||= merchant
  end

  def random
    merchant.sample
  end

  def find_by_name(name)
    find_by_string_parameter(merchant, :name, name)
  end

  def find_all_by_name(name)
    find_all_by_string_parameter(merchant, :name, name)
  end

  def find_by_id(id)
    find_by_parameter(merchant, :id, id)
  end

  def find_by_created_at(created_at)
    find_by_parameter(merchant, :created_at, created_at)
  end

  def find_all_by_created_at(created_at)
    find_all_by_parameter(merchant, :created_at, created_at )
  end

  def find_by_updated_at(updated_at)
    find_by_parameter(merchant, :updated_at, updated_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_by_string_parameter(merchant, :updated_at, updated_at)
  end

  def all_items(merchant_id)
    sales_engine.find_items_sold_by_merchant(merchant_id)
  end

  def all_invoices(merchant_id)
    sales_engine.find_invoices_for_merchant(merchant_id)
  end

  def most_revenue(number)
    merchant.sort_by do |merchant|
      merchant.revenue
    end.reverse.take(number)
  end

  def most_items(number)
    merchant.max_by(number) do |merchant|
      merchant.total_items_sold
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
  #   @all_invoices_across_all_merchants ||= merchant.flat_map {|merchant| all_invoices(merchant.id) }
  # end
end
