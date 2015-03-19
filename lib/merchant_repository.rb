require_relative "merchant"
require_relative "finder"
require "bigdecimal"

class MerchantRepository
  include Finder

  attr_reader :merchants,
              :inspect,
              :sales_engine

  def initialize(data, sales_engine)
    @merchants  ||= data.map {|row| Merchant.new(row, self)}
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
    find_as_string(merchants, :name, name)
  end

  def find_all_by_name(name)
    find_all_as_string(merchants, :name, name)
  end

  def find_by_id(id)
    find_by(merchants, :id, id)
  end

  def find_by_created_at(created_at)
    find_by(merchants, :created_at, created_at)
  end

  def find_all_by_created_at(created_at)
    find_all_by(merchants, :created_at, created_at)
  end

  def find_by_updated_at(updated_at)
    find_by(merchants, :updated_at, updated_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_as_string(merchants, :updated_at, updated_at)
  end

  def customer(customer_id)
    sales_engine.customer(customer_id)
  end

  def successful_invoices
    @successful_invoices ||= sales_engine.successful_invoices
  end

  def successful_invoice_items
    @successful_invoice_items ||= sales_engine.successful_invoice_items
  end

  def all_items(merchant_id)
    sales_engine.find_items_sold_by_merchant(merchant_id)
  end

  def all_invoices(merchant_id)
    sales_engine.find_invoices_for_merchant(merchant_id)
  end

  def most_revenue(number)
    merchants.max_by(number) do |merchant|
      merchant.revenue
    end
  end

  def most_items(number)
    merchants.max_by(number) do |merchants|
      merchants.total_items_sold
    end
  end

  def invoices_by_date(date)
    successful_invoices.group_by(&:date)
  end

  def revenue(date)
    invoices_by_date[date].map(&:revenue).reduce(:+)
  end
end
