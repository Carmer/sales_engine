require_relative "parser"
require_relative "transaction"

class TransactionRepository

  def initialize(data)
    @transactions = data.map {|row| Transaction.new(row)}
  end

  def transactions
    @transactions
  end

  def inspect
    "#<#{self.class} #{@transactions.size} rows>"
  end
end
