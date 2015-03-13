require_relative "invoice_items"

class InvoiceItemsRepository

    attr_reader :invoice_items

  def initialize(data, sales_engine)
    @invoice_items = data.map {|row| InvoiceItems.new(row)}
    @sales_engine  = sales_engine
  end

  def all
    @invoice_items
  end

  def inspect
    "#<#{self.class} #{@invoice_items.size} rows>"
  end

  def all
  end

  def random
  end

  def find_by_id
  end

  def find_by_invoice_id
  end

  def find_by_item_id
  end

  

end
