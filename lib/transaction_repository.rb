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

  def all
    transactions
  end

  def random
    transactions.sample
  end

  def find_by_id()
  end

  def find_by_invoice_id()
  end

  def find_by_credit_card_number()
  end

  def find_by_credit_card_expiration_date()
  end

  def find_by_result()
  end

  def find_by_created_at()
  end

  def find_by_updated_at()
  end

  def find_all_by_id()
  end

  def find_all_by_invoice_id()
  end

  def find_all_by_credit_card_number()
  end

  def find_all_by_credit_card_expiration_date()
  end

  def find_all_by_result()
  end

  def find_all_by_created_at()
  end

  def find_all_by_updated_at()
  end
end
