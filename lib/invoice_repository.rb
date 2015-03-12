require_relative "invoice"

class InvoiceRepository

  def initialize(data)
    @data = data
  end

  def invoice
    @data.map {|row| Invoice.new(row)}
  end
end
