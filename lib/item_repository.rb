require_relative "finder"
require_relative "item"

class ItemRepository

  include Finder

  attr_reader :items,
              :sales_engine

  def initialize(data, sales_engine)
    @items = data.map {|row| Item.new(row, self)}
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
    find_by_parameter(items, :id, id)
  end

  def find_by_name(name)
    find_by_string_parameter(items, :name, name)
  end

  def find_by_description(description)
    find_by_string_parameter(items, :description, description)
  end

  def find_by_unit_price(unit_price)
    find_by_string_parameter(items, :unit_price, unit_price)
  end

  def find_by_merchant_id(merchant_id)
    find_by_parameter(items, :merchant_id, merchant_id)
  end

  def find_by_created_at(created_at)
    find_by_parameter(items, :created_at, created_at)
  end

  def find_by_updated_at(updated_at)
    find_by_parameter(items, :updated_at, updated_at)
  end

  def find_all_by_id(id)
    find_all_by_parameter(items, :id, id)
  end

  def find_all_by_name(name)
    find_all_by_string_parameter(items, :name, name)
  end

  def find_all_by_description(description)
    find_all_by_string_parameter(items, :description, description)
  end

  def find_all_by_unit_price(unit_price)
    find_all_by_parameter(items, :unit_price, unit_price)
  end

  def find_all_by_merchant_id(merchant_id)
    find_all_by_parameter(items, :merchant_id, merchant_id)
  end

  def find_all_by_created_at(created_at)
    find_all_by_parameter(items, :created_at, created_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_by_parameter(items, :updated_at, updated_at)
  end

  def find_all_invoice_items(item_id)
    sales_engine.all_invoice_item_instances(item_id)
  end

end
