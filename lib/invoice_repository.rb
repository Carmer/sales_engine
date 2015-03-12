require_relative "invoice"

class InvoiceRepository

  def initialize(data)
    @data = data
    @invoices = @data.map {|row| Invoice.new(row)}
  end

  def inspect
    "#<#{self.class} #{@items.size} rows>"
  end
end
