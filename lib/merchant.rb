require_relative "parser"

class Merchant

  attr_accessor :id,
                :name,
                :created_at,
                :updated_at

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
  end
end
