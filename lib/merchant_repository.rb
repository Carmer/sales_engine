require_relative "parser"
require_relative "merchant"

class MerchantRepository

  def initialize(data)
    @data = data
  end

  def merchants
    @data.map {|row| Merchant.new(row)}
  end
end
