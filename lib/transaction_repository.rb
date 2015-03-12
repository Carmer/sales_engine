require_relative "parser"
require_relative "transaction"

class TransactionRepository

  def initialize(data)
    @data = data
    @transactions = @data.map {|row| Transaction.new(row)}
  end
  
  def inspect
    "#<#{self.class} #{@items.size} rows>"
  end

end
