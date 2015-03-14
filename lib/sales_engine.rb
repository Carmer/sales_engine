require 'csv'
require_relative "customer_repository"
require_relative "merchant_repository"
require_relative "item_repository"
require_relative "invoice_items_repository"
require_relative "invoice_repository"
require_relative "transaction_repository"

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
    merchant_repository
    customer_repository
    item_repository
    invoice_items_repository
    invoice_repository
    transaction_repository
  end

  def customer_repository
    data = Parser.new.parse(@filepath, "customers.csv")
    @customer_repository = CustomerRepository.new(data, self)
  end

  def merchant_repository
    data = Parser.new.parse(@filepath, "merchants.csv")
    @merhcant_repository = MerchantRepository.new(data, self)
  end

  def item_repository
    data = Parser.new.parse(@filepath, "items.csv")
    @item_repository = ItemRepository.new(data, self)
  end

  def invoice_items_repository
    data = Parser.new.parse(@filepath, "invoice_items.csv")
    @invoice_items_repository = InvoiceItemsRepository.new(data, self)
  end

  def invoice_repository
    data = Parser.new.parse(@filepath, "invoices.csv")
    @invoice_repository = InvoiceRepository.new(data, self)
  end

  def transaction_repository
    data = Parser.new.parse(@filepath, "transactions.csv")
    @transaction_repository = TransactionRepository.new(data, self)
  end
end