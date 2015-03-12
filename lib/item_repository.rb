require_relative "parser"
require_relative "item"

class ItemRepository

  def initialize(data)
    @data = data
  end

  def items
    @data.map {|row| Item.new(row)}
  end
end
