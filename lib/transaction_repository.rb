require_relative "parser"
require_relative "transaction"

class TransactionRepository

  def initialize(data)
    @data = data
  end

  def transactions
    @data.map {|row| Transaction.new(row)}
  end
end
