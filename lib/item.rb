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
    # best_day_hash = {}    { "3/25/12": 6, "3/26/12": 4 }
    # self.successful_invoice_items.each do |invoice_item|
    #   date     = invoice_item.invoice_date
    #   quantity = invoice_item.quantity
    #   best_day_hash[date] += quantity
    # end
    # search the hash and return the key with highest value
    #   (aka the date with highest quant)
    best_day = {}
    find_successful_invoice_items.each do |ii|
      date = ii.invoice.created_at
      quantity = ii.quantity
      best_day[date] += quantity
     require 'pry' ; binding.pry
    end
     best_day.max_by {|k,v| v}
    #group invoices by day
    #find all corresponding II for all invoices for that day
        #find all invoice items that have an invoice id invoice_by_day
    #find all II by item_id
    #sum the quantity

  end
end
