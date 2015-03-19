require_relative "finder"
require_relative "item"
require_relative "sales_engine"

class ItemRepository
  include Finder

  attr_reader :items,
              :sales_engine

  def initialize(data, sales_engine)
    @items      ||= data.map { |row| Item.new(row, self) }
    @sales_engine = sales_engine
  end

  def inspect
    "#<#{self.class} #{@items.size} rows>"
  end

  def all
    items
  end

  def random
    items.sample
  end

  def find_by_id(id)
    find_by(items, :id, id)
  end

  def find_by_name(name)
    find_as_string(items, :name, name)
  end

  def find_by_description(description)
    find_as_string(items, :description, description)
  end

  def find_by_unit_price(unit_price)
    find_by(items, :unit_price, unit_price)
  end

  def find_by_merchant_id(merchant_id)
    find_by(items, :merchant_id, merchant_id)
  end

  def find_by_created_at(created_at)
    find_by(items, :created_at, created_at)
  end

  def find_by_updated_at(updated_at)
    find_by(items, :updated_at, updated_at)
  end

  def find_all_by_name(name)
    find_all_as_string(items, :name, name)
  end

  def find_all_by_description(description)
    find_all_as_string(items, :description, description)
  end

  def find_all_by_unit_price(unit_price)
    find_all_by(items, :unit_price, unit_price)
  end

  def find_all_by_merchant_id(merchant_id)
    find_all_by(items, :merchant_id, merchant_id)
  end

  def find_all_by_created_at(created_at)
    find_all_by(items, :created_at, created_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_by(items, :updated_at, updated_at)
  end

  def find_all_invoice_items(item_id)
    sales_engine.all_invoice_items(item_id)
  end

  def merchant(merchant_id)
    sales_engine.merchant_information(merchant_id)
  end

  def most_revenue(number)
    items.max_by(number) do |item|
      item.total_revenue
    end
  end

  def successful_invoice_items
    sales_engine.successful_invoice_items
  end

  def most_items(n)
    items.max_by(n) { |item| item.quantity_sold}
  end
end
