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
    @invoices_result ||= repository.all_invoices(id)
  end

  def transactions
    @all_transactions ||= invoices.map { |invoice| invoice.transactions }
  end

  def favorite_merchant
    favorite_merchant = successful_invoices.max_by do |invoice|
      successful_invoices.count(invoice.merchant_id)
    end
    repository.find_merchant(favorite_merchant.merchant_id)
  end

  def successful_invoices
    @all ||= repository.find_successful_invoices.select do |invoice|
      invoice.customer_id == id
    end
  end
end
