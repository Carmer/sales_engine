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

  # def total_revenue
  #   @successful_invoices = invoices.find_all do |invoice|
  #     invoice.successful?
  #   end
  #
  #   @invoice_items = @successful_invoices.map do |successful|
  #     successful.invoice_items
  #   end.flatten
  #
  #   @invoice_items.reduce(1) do |product, invoice_item|
  #     product * invoice_item.quantity.to_i * invoice_item.unit_price.to_i
  #   end
  # end

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

  def revenue(date = nil)
    if date.nil?
      total_merchant_revenue
    else
      revenue_by_date(date)
    end
  end

  private

    def revenue_by_date(date)

      invoices_by_date = successful_invoices.find_all do |invoice|
      Date.parse(invoice.created_at.to_s) == Date.parse(date.to_s)
      end

      invoice_items = invoices_by_date.flat_map do |invoice|
        invoice.invoice_items
      end

      invoice_items_revenue = invoice_items.map  do |invoice_item|
        invoice_item.quantity * invoice_item.unit_price
      end.reduce(:+) / 100.00
    end

    def total_merchant_revenue
      invoice_items = successful_invoices.flat_map do |invoice|
        invoice.invoice_items
      end

      invoice_items.map do |invoice_item|
      invoice_item.quantity * invoice_item.unit_price
      end.reduce(:+) / 100
    end

    def successful_invoices
      @successful_invoices ||= invoices.find_all do |invoice|
        invoice.successful?
      end
    end
end
