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
    @invoice_items ||= repository.find_all_invoice_items(id)
  end

  def merchant
    @merchant ||= repository.find_merchant(merchant_id)
  end

  def best_day
    max = invoice_items.max_by { |i_item| i_item.quantity }
    max.invoice.created_at
  end

  def quantity_sold
    @successful_i_item ||= repository.successful_invoice_items.select do |ii|
      ii.item_id == id
    end

    @successful_i_item.reduce(0) do |sum, i_item|
      sum + i_item.quantity
    end
  end

  def total_revenue
    @specific_item_ids ||= repository.successful_invoice_items.select do |ii|
      ii.item_id == id
    end

    @total_revenue ||= @specific_item_ids.reduce(0) do |sum, i_item|
      sum + (i_item.quantity * i_item.unit_price)
    end
  end
end
