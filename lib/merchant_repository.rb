require_relative "merchant"
require_relative "finder"

class MerchantRepository

  include Finder

  attr_reader :merchant,
              :inspect,
              :sales_engine

  def initialize(data, sales_engine)
    @merchant   ||= data.map {|row| Merchant.new(row, self)}
    @sales_engine = sales_engine
  end

  def inspect
    "#<#{self.class} #{@merchant.size} rows>"
  end

  def all
    merchant
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
    sorted = merchant.sort_by do |merchant|
      merchant.total_revenue
    end.reverse.take(3)
  end
end
