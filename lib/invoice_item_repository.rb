require_relative "invoice_item"
require_relative "finder"
require_relative "sales_engine"

class InvoiceItemRepository

  include Finder

  attr_reader :invoice_items,
              :sales_engine

  def initialize(data, sales_engine)
    @invoice_items ||= data.map {|row| InvoiceItem.new(row, self)}
    @sales_engine    = sales_engine
  end

  def all
    @invoices ||= invoice_items
  end

  def random
    invoice_items.sample
  end

  def inspect
    "#<#{self.class} #{@invoice_items.size} rows>"
  end

  def find_by_id(id)
    find_by(invoice_items, :id, id)
  end

  def find_by_invoice_id(invoice_id)
    find_by(invoice_items, :invoice_id, invoice_id)
  end

  def find_by_item_id(item_id)
    find_by(invoice_items, :item_id, item_id)
  end

  def find_by_quantity(quantity)
    find_by(invoice_items, :quantity, quantity)
  end

  def find_by_unit_price(unit_price)
    find_by(invoice_items, :unit_price, unit_price)
  end

  def find_by_created_at(created_at)
    find_by(invoice_items, :created_at, created_at)
  end

  def find_by_updated_at(updated_at)
    find_by(invoice_items, :updated_at, updated_at)
  end

  def find_all_by_id(id)
    find_all_by(invoice_items, :id, id)
  end

  def find_all_by_invoice_id(invoice_id)
    find_all_by(invoice_items, :invoice_id, invoice_id)
  end

  def find_all_by_item_id(item_id)
    find_all_by(invoice_items, :item_id, item_id)
  end

  def find_all_by_quantity(quantity)
    find_all_by(invoice_items, :quantity, quantity)
  end

  def find_all_by_unit_price(unit_price)
    find_all_by(invoice_items, :unit_price, unit_price)
  end

  def find_all_by_created_at(created_at)
    find_all_by(invoice_items, :created_at, created_at)
  end

  def find_all_by_updated_at(updated_at)
    find_all_by(invoice_items, :updated_at, updated_at)
  end

  def invoice_instance(invoice_id)
    sales_engine.find_invoice_for_invoice_item(invoice_id)
  end

  def item(item_id)
    sales_engine.find_item(item_id)
  end

  def add_item(items, invoice_id)
    items.each do |i|

      data = {
        :id         => next_id,
        :item_id    => i.id,
        :invoice_id => invoice_id,
        :quantity   => count_items(items)[i],
        :unit_price => i.unit_price,
        :created_at => Time.now,
        :updated_at => Time.now
        }

      invoice_items << InvoiceItem.new(data, self)

    end
  end

  def next_id
    invoice_items.last.id + 1
  end

  def count_items(items)
    item_count = Hash.new(0)

    items.each do |i|
      item_count[i] += 1
    end
    item_count
  end

  def all_successful_invoice_items
    @successful_invoices ||= sales_engine.successful_invoices
    @successful_invoice_items ||= invoice_items.select do |invoice_item|
      @successful_invoices.any?  do |invoice|
        invoice.id == invoice_item.invoice_id
      end
    end
  end
end
