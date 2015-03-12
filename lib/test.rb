def greeting(a: "bob", b: 3, c: "july")
  "#{a} has an id of #{b} and started business in #{c}"  # => "Harry has an id of 3 and started business in june"
end                                                      # => nil

puts greeting(a: "Harry", b: 3, c: "june")  # => nil

# >> Harry has an id of 3 and started business in june
class Merchant
  attr_reader :id

  def initialize(:id "1", :name "Grubb and Grubb", :created_at "2012-03-27 14:54:08 UTC", :updated_at "2012-03-27 14:54:08 UTC")
    @id = :id
  end
end

merchant = Merchant.new
merchant.id
