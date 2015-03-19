require_relative "finder"
require_relative "transaction"

class TransactionRepository
  include Finder

  attr_accessor :transactions

  attr_reader   :sales_engine

  def initialize(data, sales_engine)
    @transactions   = data.map {|row| Transaction.new(row, self)}
    @sales_engine   = sales_engine
  end

  def charge(inputs, invoice_id)
    data = {
      :id => next_id,
      :invoice_id => invoice_id,
      :credit_card_number => inputs[:credit_card_number],
      :credit_card_expiration_date => inputs[:credit_card_expiration],
      :result => inputs[:result],
      :created_at => Time.now.to_s,
      :updated_at => Time.now.to_s
    }

    new_transaction = Transaction.new(data, self)
    transactions.push(new_transaction)
  end

  def next_id
    transactions.last.id + 1
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

  def find_by_id(id)
    find_by(transactions, :id, id)
  end

  def find_by_invoice_id(invoice_id)
    find_by(transactions, :invoice_id , invoice_id)
  end

  def find_by_credit_card_number(credit_card_number)
    find_by(transactions, :credit_card_number, credit_card_number)
  end

  def find_by_result(result)
    find_as_string(transactions, :result, result)
  end

  def find_by_created_at(created_at)
    find_by(transactions, :created_at, created_at)
  end

  def find_by_updated_at(updated_at)
    find_by(transactions, :updated_at, updated_at)
  end

  def find_all_by_invoice_id(invoice_id)
    find_all_by(transactions, :invoice_id, invoice_id)
  end

  def find_all_by_credit_card_number(credit_card_number)
    find_all_by(transactions, :credit_card_number, credit_card_number)
  end

  def find_all_by_result(result)
    find_all_as_string(transactions, :result, result)
  end

  def find_all_by_created_at(created_at)
    find_all_by(transactions, :created_at, created_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_by(transactions, :updated_at, updated_at)
  end

  def find_an_invoice(invoice_id)
    sales_engine.find_an_invoice_instance(invoice_id)
  end

  def find_all_successful_transactions
    transactions.select { |transaction| transaction.successful? }
  end
end
