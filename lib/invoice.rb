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

  def items
    @items ||= begin

      invoice_items = repository.all_invoice_items(id)

      item_ids = invoice_items.map do |invoice_items|
        invoice_items.item_id
      end.uniq

       item_ids.map do |item_id|
         repository.find_item(item_id)
       end
    end
  end

  def successful?
    @is_it_success ||= transactions.any? do |transaction|
      transaction.result == "success"
    end
  end

  #jeff's create
  def add_items(items)
    #remember there could be repeats
    #call group_by on items to group them by item id
    #iterate through that result and for each pair create an invoice item, set the item id to the key, set the quantity to the number of items in thevalue
    #set the invoice id to my id
    #add the ii to ii repo
  end
end
