require 'csv'
require 'pry'

class Parser
  def parse(filename)
    contents = CSV.open "./data/#{filename}", headers: true, header_converters: :symbol

    contents.map do |row|
      row
    end
  end
end

# merchants = Parser.new.parse("merchants.csv")
#
# puts merchants[2]
#
# row = merchants[0]
# puts merchant_1[:id]
#
# class Merchant
#   attr_accessor :id, :name
#   def initialize(row)
#     @id = row[:id]
#     @name = row[:name]
#     @created_at = row[:created_at]
#     @updated_at = row[:updated_at]
#   end
# end
#
#{:id=>"86", :name=>"Marvin Group", :created_at=>"2012-03-27 14:54:07 UTC", :updated_at=>"2012-03-27 14:54:07 UTC"}


# merchant = Merchant.new(row)
# puts "This merchant has an id of #{merchant.id} and a name of #{merchant.name}"
