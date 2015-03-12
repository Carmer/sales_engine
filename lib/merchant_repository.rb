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

mr = MerchantRepository.new(Parser.new.parse("merchants.csv"))
puts mr.merchants[9].name
