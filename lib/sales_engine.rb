require 'csv'

class SalesEngine



  attr_accessor :merchant_repository,
                :customer_repository,
                :item_repository,
                :invoice_items_repository,
                :invoice_repository,
                :transaction_repository

  def initialize(filepath)
    @filepath = filepath
    startup
  end

  def startup
    merhcant_repository
    customer_repository
    item_repositoy
    invoice_items_repository
    invoice_repository
    transaction_repository
  end

  def customer_repository
    data = Parse.new.parse(@filepath, "sample_customers.csv")
    @customer_reposioty = CustomerRepository.new(data, self)
  end

  def merhcant_repository
    data = Parse.new.parse(@filepath, "sample_merchant.csv")
    @customer_reposioty = CustomerRepository.new(data, self)
  end

  def item_repository
    data = Parse.new.parse(@filepath, "sample_items.csv")
    @customer_reposioty = CustomerRepository.new(data, self)
  end

  def invoice_items_repository
    data = Parse.new.parse(@filepath, "sample_invoice_items.csv")
    @customer_reposioty = CustomerRepository.new(data, self)
  end

  def invoice_repository
    data = Parse.new.parse(@filepath, "sample_invoices.csv")
    @customer_reposioty = CustomerRepository.new(data, self)
  end

  def transaction_repository
    data = Parse.new.parse(@filepath, "sample_transactions.csv")
    @customer_reposioty = CustomerRepository.new(data, self)
  end
end
