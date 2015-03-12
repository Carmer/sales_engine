require_relative "parser"
require_relative "merchant"

class MerchantRepository

  def initialize(data)
    @data = data
    @inspect = @data.map {|row| Merchant.new(row)}
  end
  
  def inspect
    "#<#{self.class} #{@items.size} rows>"
  end

end
