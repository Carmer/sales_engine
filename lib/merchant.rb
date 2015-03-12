require_relative "parser"
#1,Schroeder-Jerde,2012-03-27 14:53:59 UTC,2012-03-27 14:53:59 UTC

merchants = Parser.new.parse("merchants.csv")
data = merchants[0]


class Merchant
  attr_accessor :id, :name, :created_at, :updated_at

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end
end

merchant = Merchant.new(data)
puts "This nice merchant has an id of #{merchant.id} and a name of #{merchant.name}"
