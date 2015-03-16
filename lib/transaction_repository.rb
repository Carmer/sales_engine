require_relative "finder"
require_relative "transaction"

class TransactionRepository

  include Finder

  attr_reader :transaction,
              :sales_engine

  def initialize(data, sales_engine)
    @transaction = data.map {|row| Transaction.new(row, self)}
    @sales_engine = sales_engine
  end

  def inspect
    "#<#{self.class} #{@transaction.size} rows>"
  end

  def all
    transaction
  end

  def random
    transaction.sample
  end

  def find_by_id(id)
    find_by_parameter(transaction, :id, id)
  end

  def find_by_invoice_id(invoice_id)
    find_by_parameter(transaction, :invoice_id , invoice_id)
  end

  def find_by_credit_card_number(credit_card_number)
    find_by_parameter(transaction, :credit_card_number, credit_card_number)
  end

  # --> Do we need these method since we dont have cc expiration dates in data?

  # def find_by_credit_card_expiration_date(credit_card_expiration_date)
  #   find_by_parameter(transaction, :credit_card_expiration_date, credit_card_expiration_date)
  # end

  # def find_all_by_credit_card_expiration_date(credit_card_expiration_date)
  #   find_all_by_parameter(transaction, :credit_card_expiration_date, credit_card_expiration_date)
  # end

  def find_by_result(result)
    find_by_string_parameter(transaction, :result, result)
  end

  def find_by_created_at(created_at)
    find_by_parameter(transaction, :created_at, created_at)
  end

  def find_by_updated_at(updated_at)
    find_by_parameter(transaction, :updated_at, updated_at)
  end

  def find_all_by_invoice_id(invoice_id)
    find_all_by_parameter(transaction, :invoice_id, invoice_id)
  end

  def find_all_by_credit_card_number(credit_card_number)
    find_all_by_parameter(transaction, :credit_card_number, credit_card_number)
  end

  def find_all_by_result(result)
    find_all_by_string_parameter(transaction, :result, result)
  end

  def find_all_by_created_at(created_at)
    find_all_by_parameter(transaction, :created_at, created_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_by_parameter(transaction, :updated_at, updated_at)
  end

  def find_an_invoice(invoice_id)
    sales_engine.find_an_invoice_instance(invoice_id)
  end
end
