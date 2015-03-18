require_relative "finder"
require_relative "item"
require_relative "sales_engine"

class ItemRepository

  include Finder

  attr_reader :item,
              :sales_engine

  def initialize(data, sales_engine)
    @item        = data.map {|row| Item.new(row, self)}
    @sales_engine = sales_engine
  end

  def inspect
    "#<#{self.class} #{@item.size} rows>"
  end

  def all
    item
  end

  def random
    item.sample
  end

  def find_by_id(id)
    find_by_parameter(item, :id, id)
  end

  def find_by_name(name)
    find_by_string_parameter(item, :name, name)
  end

  def find_by_description(description)
    find_by_string_parameter(item, :description, description)
  end

  def find_by_unit_price(unit_price)
    find_by_parameter(item, :unit_price, unit_price)
  end

  def find_by_merchant_id(merchant_id)
    find_by_parameter(item, :merchant_id, merchant_id)
  end

  def find_by_created_at(created_at)
    find_by_parameter(item, :created_at, created_at)
  end

  def find_by_updated_at(updated_at)
    find_by_parameter(item, :updated_at, updated_at)
  end

  def find_all_by_name(name)
    find_all_by_string_parameter(item, :name, name)
  end

  def find_all_by_description(description)
    find_all_by_string_parameter(item, :description, description)
  end

  def find_all_by_unit_price(unit_price)
    find_all_by_parameter(item, :unit_price, unit_price)
  end

  def find_all_by_merchant_id(merchant_id)
    find_all_by_parameter(item, :merchant_id, merchant_id)
  end

  def find_all_by_created_at(created_at)
    find_all_by_parameter(item, :created_at, created_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_by_parameter(item, :updated_at, updated_at)
  end

  def find_all_invoice_items(item_id)
    sales_engine.all_invoice_items(item_id)
  end

  def find_merchant(merchant_id)
    sales_engine.merchant_information(merchant_id)
  end

  def most_revenue(number)
    item.max_by(number) do |item|
      item.total_revenue
    end
  end
end
