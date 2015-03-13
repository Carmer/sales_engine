require_relative "parser"
require_relative "transaction"

class TransactionRepository

  attr_reader :transactions

  def initialize(data, sales_engine)
    @transactions = data.map {|row| Transaction.new(row)}
    @sales_engine = sales_engine
  end

  def transactions
    @transactions
  end

  def inspect
    "#<#{self.class} #{@transactions.size} rows>"
  end
end
