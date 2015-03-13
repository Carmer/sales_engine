require_relative "invoice"

class InvoiceRepository

  def initialize(data, sales_engine)
    @invoice      = data.map {|row| Invoice.new(row)}
    @sales_engine = sales_engine
  end

  def invoices
    @invoice
  end

  def inspect
    "#<#{self.class} #{@items.size} rows>"
  end
end
