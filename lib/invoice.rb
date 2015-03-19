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
    @created_at   = Date.parse(data[:created_at])
    @updated_at   = data[:updated_at]
    @repository   = repository
  end

  def transactions
    @transactions ||= repository.all_transactions(id)
  end

  def invoice_items
    @invoice_items ||= repository.all_invoice_items(id)
  end

  def customer
    @customer = repository.customer_instance(customer_id)
  end

  def merchant
    @merchant = repository.merchant_instance(merchant_id)
  end

  def add_items(items, invoice_id)
    repository.sales_engine.add_item(items, invoice_id)
  end

  def items

    invoice_items = repository.all_invoice_items(id)

    item_ids = invoice_items.map do |invoice_items|
      invoice_items.item_id
    end.uniq

     item_ids.map do |item_id|
       repository.find_item(item_id)
     end
  end
end
