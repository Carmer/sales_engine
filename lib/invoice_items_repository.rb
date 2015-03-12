require_relative "invoice_items"

class InvoiceItemsRepository

  def initialize(data)
    @data = data
  end

  def invoice_items
    data.map {|row| InvoiceItems.new(row)}
  end
end
