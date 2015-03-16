class Merchant

  attr_accessor :id,
                :name,
                :created_at,
                :updated_at,
                :repository

  def initialize(data, repository)
    @id         = data[:id].to_i
    @name       = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @repository = repository
  end

  def items
    @items ||= repository.all_items(id)
  end

  def invoices
    @invoices ||= repository.all_invoices(id)
  end

  def total_revenue
    @successful_invoices ||= invoices.find_all do |invoice|
      invoice.successful?
    end

    @invoice_items ||= @successful_invoices.map do |successful|
      successful.invoice_items
    end.flatten

    @invoice_items.reduce(1) do |product, invoice_item|
      product * invoice_item.quantity.to_i * invoice_item.unit_price.to_i
    end
  end

  def total_items_sold
    @successful_invoices ||= invoices.find_all do |invoice|
      invoice.successful?
    end

    @invoice_items ||= @successful_invoices.map do |successful|
      successful.invoice_items
    end.flatten

    @invoice_items.reduce(0) do |sum, invoice_item|
      sum + invoice_item.quantity.to_i
    end
  end
end
