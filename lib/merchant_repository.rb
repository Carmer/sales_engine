require_relative "parser"
require_relative "merchant"

class MerchantRepository

  attr_reader :merchant

  def initialize(data, sales_engine)
    @merchant   ||= data.map {|row| Merchant.new(row)}
    @sales_engine = sales_engine
  end

  def inspect
    "#<#{self.class} #{@items.size} rows>"
  end

end
