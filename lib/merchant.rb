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

  def find_successful_invoices
    @successful_invoices ||= repository.sales_engine.invoice_repository.all_successful_invoices
    @all_successful_invoices_for_merchant ||= @successful_invoices.select do |invoice|
      invoice.merchant_id == id
    end
  end

  def find_successful_invoice_items
    @successful_invoice_items ||= repository.sales_engine.invoice_item_repository.all_successful_invoice_items
    @all_successful_invoice_items ||= @successful_invoice_items.select do |ii|
      find_successful_invoices.any? do |invoice|
        invoice.id == ii.invoice_id
      end
    end
  end

  def total_items_sold
    @item_total ||= find_successful_invoice_items.reduce(0) do |sum, ii|
      sum + ii.quantity
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
    #returns customer who has made the most successful transactions
    #find successful invoices, of those, find the transactions (invoice.transactions)
    #transaction.successful?
    @transactions ||= find_successful_invoices.map do |invoice|
      invoice.transactions
    end

    @successful_transactions ||= @transactions.select do |transaction|
      transaction.result == "success"
    end
    

  end

  private

    def revenue_by_date(date)

      invoices_by_date = find_successful_invoices.find_all do |invoice|
      Date.parse(invoice.created_at.to_s) == Date.parse(date.to_s)
      end

      invoice_items = invoices_by_date.flat_map do |invoice|
        invoice.invoice_items
      end

      invoice_items.reduce(0)  do |sum , ii|
        sum + (ii.quantity * ii.unit_price) / 100.00
      end
    end

    def total_merchant_revenue
      find_successful_invoice_items.reduce(0) do |sum, ii|
        sum + (ii.quantity * ii.unit_price) / 100.00
      end
    end
end
