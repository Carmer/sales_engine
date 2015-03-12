require_relative "invoice_items"

class InvoiceItemsRepository

    attr_reader :invoice_items

  def initialize(data)
    @data = data
    @invoice_items = @data.map {|row| InvoiceItems.new(row)}
  end

  def all
    @invoice_items
  end

  def inspect
    "#<#{self.class} #{@invoice_items.size} rows>"
  end

end
