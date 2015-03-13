require_relative "parser"
require_relative "item"

class ItemRepository

  attr_reader :items

  def initialize(data, sales_engine)
    @items = data.map {|row| Item.new(row)}
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
    items.find {|item| item.id == id}
  end

  def find_by_name(name)
    items.find {|item| item.name == name}
  end

  def find_by_description()
  end

  def find_by_unit_price()
  end

  def find_by_merchant_id()
  end

  def find_by_created_at()
  end

  def find_by_updated_at()
  end
end
