require_relative "invoice_item"
require_relative "finder"
require_relative "sales_engine"

class InvoiceItemRepository

  include Finder

  attr_reader :invoice_item,
              :sales_engine

  def initialize(data, sales_engine)
    @invoice_item  = data.map {|row| InvoiceItem.new(row, self)}
    @sales_engine  = sales_engine
  end

  def all
    @invoices ||= invoice_item
  end

  def random
    invoice_item.sample
  end

  def inspect
    "#<#{self.class} #{@invoice_item.size} rows>"
  end

  def find_by_id(id)
    find_by_parameter(invoice_item, :id, id)
  end

  def find_by_invoice_id(invoice_id)
    find_by_parameter(invoice_item, :invoice_id, invoice_id)
  end

  def find_by_item_id(item_id)
    find_by_parameter(invoice_item, :item_id, item_id)
  end

  def find_by_quantity(quantity)
    find_by_parameter(invoice_item, :quantity, quantity)
  end

  def find_by_unit_price(unit_price)
    find_by_parameter(invoice_item, :unit_price, unit_price)
  end

  def find_by_created_at(created_at)
    find_by_parameter(invoice_item, :created_at, created_at)
  end

  def find_by_updated_at(updated_at)
    find_by_parameter(invoice_item, :updated_at, updated_at)
  end

  def find_all_by_id(id)
    find_all_by_parameter(invoice_item, :id, id)
  end

  def find_all_by_invoice_id(invoice_id)
    find_all_by_parameter(invoice_item, :invoice_id, invoice_id)
  end

  def find_all_by_item_id(item_id)
    find_all_by_parameter(invoice_item, :item_id, item_id)
  end

  def find_all_by_quantity(quantity)
    find_all_by_parameter(invoice_item, :quantity, quantity)
  end

  def find_all_by_unit_price(unit_price)
    find_all_by_parameter(invoice_item, :unit_price, unit_price)
  end

  def find_all_by_created_at(created_at)
    find_all_by_parameter(invoice_item, :created_at, created_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_by_parameter(invoice_item, :updated_at, updated_at)
  end

  def invoice_instance(invoice_id)
    sales_engine.find_invoice_for_invoice_item(invoice_id)
  end

  def item(item_id)
    sales_engine.find_item(item_id)
  end

  def all_successful_invoice_items
    @successful_invoices ||= sales_engine.invoice_repository.all_successful_invoices
    @successful_invoice_items ||= invoice_item.select do |invoice_item|
      @successful_invoices.any?  do |invoice|
        invoice.id == invoice_item.invoice_id
      end
    end
  end
end
