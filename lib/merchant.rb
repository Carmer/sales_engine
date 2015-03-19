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

  def total_items_sold
    @item_total ||= successful_invoice_items.reduce(0) do |sum, i_item|
      sum + i_item.quantity
    end
  end

  def revenue(date = nil)
    if date.nil?
      total_merchant_revenue
    else
      revenue_by_date(date)
    end
  end

  def favorite_customer
  @all_merchant_customers ||= successful_invoices.map do |invoice|
    invoice.customer
  end

   @all_merchant_customers.max_by do |customer|
     @all_merchant_customers.count(customer)
   end
 end

  def successful_invoices
    @successful_invoices ||= repository.successful_invoices

    @all_i ||= @successful_invoices.select do |invoice|
      invoice.merchant_id == id
    end
  end

  def successful_invoice_items
    @successful_invoice_items ||= repository.successful_invoice_items

    @all_i_items ||= @successful_invoice_items.select do |i_item|
      successful_invoices.any? do |invoice|
        invoice.id == i_item.invoice_id
      end
    end
  end

  def revenue_by_date(date)
    @invoices_by_date ||= successful_invoices.find_all do |invoice|
      Date.parse(invoice.created_at.to_s) == Date.parse(date.to_s)
    end

    @invoice_items ||= @invoices_by_date.flat_map do |invoice|
      invoice.invoice_items
    end

    @invoice_items.reduce(0)  do |sum , i_item|
      sum + (i_item.quantity * i_item.unit_price) / 100.00
    end
  end

  def total_merchant_revenue
    successful_invoice_items.reduce(0) do |sum, i_item|
      sum + (i_item.quantity * i_item.unit_price) / 100.00
    end
  end

  def customers_with_pending_invoices
    unsuccessful_invoices = invoices - successful_invoices

    unsuccessful_invoices.map {|ui| ui.customer}
  end
end
