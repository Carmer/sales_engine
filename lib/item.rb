require "bigdecimal"

class Item

  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at,
              :repository

  def initialize(data, repository)
    @id          = data[:id].to_i
    @name        = data[:name]
    @description = data[:description]
    @unit_price  = BigDecimal.new(data[:unit_price]) / 100
    @merchant_id = data[:merchant_id].to_i
    @created_at  = data[:created_at]
    @updated_at  = data[:updated_at]
    @repository  = repository
  end

  def invoice_items
    @invoice_items = repository.find_all_invoice_items(id)
  end

  def merchant
    @merchant = repository.find_merchant(merchant_id)
  end

  def best_day
    dates = invoice_items.map { |invoice_items| invoice_items.created_at }
    dates.max_by { |date| dates.include?(date) }
  end
end
