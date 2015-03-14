require_relative "invoice"

class InvoiceRepository

  attr_reader :invoices

  def initialize(data, sales_engine)
    @invoices      = data.map {|row| Invoice.new(row)}
    @sales_engine = sales_engine
  end

  def inspect
    "#<#{self.class} #{@items.size} rows>"
  end

  def random
    @invoices.random
  end

  def find_by_invoice_id
  end
end
