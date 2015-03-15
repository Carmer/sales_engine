require_relative "invoice_items"
require_relative "finder"
require_relative "sales_engine"

class InvoiceItemsRepository

  include Finder

  attr_reader :invoice_items,
              :sales_engine

  def initialize(data, sales_engine)
    @invoice_items = data.map {|row| InvoiceItems.new(row, self)}
    @sales_engine  = sales_engine
  end

  def all
    invoice_items
  end

  def random
    invoice_items.sample
  end

  def inspect
    "#<#{self.class} #{@invoice_items.size} rows>"
  end


  def find_by_id(id)
    find_by_parameter(invoice_items, :id, id)
  end

  def find_by_invoice_id(invoice_id)
    find_by_parameter(invoice_items, :invoice_id, invoice_id)
  end

  def find_by_item_id(item_id)
    find_by_parameter(invoice_items, :item_id, item_id)
  end

  def find_by_quantity(quantity)
    find_by_parameter(invoice_items, :quantity, quantity)
  end

  def find_by_unit_price(unit_price)
    find_by_parameter(invoice_items, :unit_price, unit_price)
  end

  def find_by_created_at(created_at)
    find_by_parameter(invoice_items, :created_at, created_at)
  end

  def find_by_updated_at(updated_at)
    find_by_parameter(invoice_items, :updated_at, updated_at)
  end

  def find_all_by_id(id)
    find_all_by_parameter(invoice_items, :id, id)
  end

  def find_all_by_invoice_id(invoice_id)
    find_all_by_parameter(invoice_items, :invoice_id, invoice_id)
  end

  def find_all_by_item_id(item_id)
    find_all_by_parameter(invoice_items, :item_id, item_id)
  end

  def find_all_by_quantity(quantity)
    find_all_by_parameter(invoice_items, :quantity, quantity)
  end

  def find_all_by_unit_price(unit_price)
    find_all_by_parameter(invoice_items, :unit_price, unit_price)
  end

  def find_all_by_created_at(created_at)
    find_all_by_parameter(invoice_items, :created_at, created_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_by_parameter(invoice_items, :updated_at, updated_at)
  end

  def invoice_instance(invoice_id)
    sales_engine.find_invoice_for_invoice_item(invoice_id)
  end

  def find_item(item_id)
    sales_engine.find_item(item_id)
  end
end
