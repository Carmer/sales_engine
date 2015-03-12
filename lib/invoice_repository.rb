require_relative "invoices"

class InvoiceRepository

  def initialize(data)
    @data = data
  end

  def invoice_items
    @data.map {|row| InvoiceItems.new(row)}
  end
end
