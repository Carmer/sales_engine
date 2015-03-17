class Invoice

  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :repository

  def initialize(data, repository)
    @id           = data[:id].to_i
    @customer_id  = data[:customer_id].to_i
    @merchant_id  = data[:merchant_id].to_i
    @status       = data[:status]
    @created_at   = data[:created_at]
    @updated_at   = data[:updated_at]
    @repository   = repository
  end

  def transactions
    @transactions = repository.all_transactions(id)
  end

  def invoice_items
    @invoice_items = repository.all_invoice_items(id)
  end

  def customer
    @customer = repository.customer_instance(customer_id)
  end

  def merchant
    @merchant = repository.merchant_instance(merchant_id)
  end

  def items
    @items = begin
      invoice_items = repository.all_invoice_items(id)
      item_ids = invoice_items.map { |invoice_items| invoice_items.item_id }.uniq
      items = item_ids.map { |item_id| repository.find_item(item_id) }
      items
    end
  end

  def successful?
    @successful = transactions.any? do |transaction|
      transaction.result == "success"
    end
  end
end
