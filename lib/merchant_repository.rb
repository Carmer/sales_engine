require_relative "parser"
require_relative "merchant"

class MerchantRepository

  attr_reader :merchant

  def initialize(data)
    @data = data
    @merchant = @data.map {|row| Merchant.new(row)}
  end

  def inspect
    "#<#{self.class} #{@items.size} rows>"
  end

end
