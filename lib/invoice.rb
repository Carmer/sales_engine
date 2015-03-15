require_relative "parser"

class Invoice

  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :repository

  def initialize(data, repository)
    @id           = data[:id]
    @customer_id  = data[:customer_id]
    @merchant_id  = data[:merchant_id]
    @status       = data[:status]
    @created_at   = data[:created_at]
    @updated_at   = data[:updated_at]
    @repository   = repository
  end

  def transactions
    repository.all_transactions(id)
  end

  def invoice_items
    repository.all_invoice_items(id)
  end

  def customer
    repository.customer_instance(customer_id)
  end

  def merchant
    repository.merchant_instance(merchant_id)    
  end
  # def items
  #   repository.all_items(id)
  # end
end
