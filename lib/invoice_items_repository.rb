require_relative "invoice_items"

class InvoiceItemsRepository

  def initialize(data)
    @data = data
  end

  def load_data
    data.map {|row| InvoiceItem.new(row)}
  end
end
