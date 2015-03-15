require_relative "parser"
require_relative "invoice"

class Merchant

  attr_accessor :id,
                :name,
                :created_at,
                :updated_at,
                :repository

  def initialize(data, repository)
    @id         = data[:id]
    @name       = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @repository = repository
  end

  def items
    repository.all_items(id)
  end

  def invoices
    repository.all_invoices(id)
  end

  def total_revenue
    invoice_items = self.invoices.map do |invoice|
      invoice.invoice_items
    end.flatten

    invoice_items.reduce(1) do |product, invoice_item|
      product * invoice_item.quantity.to_i * invoice_item.unit_price.to_i
    end
  end
end
