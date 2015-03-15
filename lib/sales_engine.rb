require_relative "parser"
require_relative "customer_repository"
require_relative "merchant_repository"
require_relative "item_repository"
require_relative "invoice_items_repository"
require_relative "invoice_repository"
require_relative "transaction_repository"
require_relative "finder"

class SalesEngine

  include Finder



  attr_accessor :merchant_repository,
                :customer_repository,
                :item_repository,
                :invoice_items_repository,
                :invoice_repository,
                :transaction_repository

  def initialize(filepath = './data/fixtures')
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
    @customer_repository ||= CustomerRepository.new(data, self)
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

  def all_customer_invoices(customer_id)
    invoice_repository.find_all_by_customer_id(customer_id)
  end

  def all_invoice_item_instances(item_id)
    invoice_items_repository.find_all_by_item_id(item_id)
  end

  def merchant_information(id)
    merchant_repository.find_by_id(id)
  end

  def find_items_sold_by_merchant(merchant_id)
    item_repository.find_all_by_merchant_id(merchant_id)
  end

  def find_invoices_for_merchant(merchant_id)
    invoice_repository.find_all_by_merchant_id(merchant_id)
  end

  def find_all_transactions_for_invoice(invoice_id)
    transaction_repository.find_all_by_invoice_id(invoice_id)
  end

  def find_customer(customer_id)
    customer_repository.find_by_id(customer_id)
  end

  def find_merchant(merchant_id)
    merchant_repository.find_by_id(merchant_id)
  end

  def find_invoice_for_invoice_item(invoice_id)
    invoice_repository.find_by_id(invoice_id)
  end

  def all_invoice_items(invoice_id)
    invoice_items_repository.find_all_by_invoice_id(invoice_id)
  end

  def find_item(item_id)
    item_repository.find_by_id(item_id)
  end

  def find_an_invoice_instance(invoice_id)
    invoice_repository.find_by_id(invoice_id)
  end
  # def find_all_items_on_invoice(invoice_id)
  #   find_all_invoice_items(invoice_id).map {|item| item_repository.find_by_id(item.item_id)}
  # end
  #
  # def find_all_invoice_items(invoice_id)
  #   invoice_items_repository.find_by_invoice_id(invoice_id)
  # end
end
