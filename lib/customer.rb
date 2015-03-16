class Customer

  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at,
              :repository

  def initialize(data, repository)
    @id         = data[:id].to_i
    @first_name = data[:first_name]
    @last_name  = data[:last_name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @repository = repository
  end

  def invoices
    repository.all_invoices(id)
  end

  def transactions
    invoices.map { |invoice| invoice.transactions }
  end

  def favorite_merchant
    #find all merchant ids on invoices
    #find most frequent merchant id
    #get merchant instance for that id
    favorite_merchant = invoices.max_by { |invoice| invoice.merchant_id }
    repository.find_merchant(favorite_merchant.merchant_id)
  end
end
