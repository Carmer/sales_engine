require_relative "invoice"

class InvoiceRepository

  def initialize(data)
    @invoice = data.map {|row| Invoice.new(row)}
  end

  def invoices
    @invoice
  end
end
