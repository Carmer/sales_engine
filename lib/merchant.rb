require_relative "parser"

class Merchant

  attr_accessor :id,
                :name,
                :created_at,
                :updated_at,
                :repository

  def initialize(data, repository)
    @id = data[:id]
    @name = data[:name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @reposiotry = repository
  end
end
