require_relative "parser"

class Customer

  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at,
              :repo

  def initialize(data, repo)
    @id         = data[:id]
    @first_name = data[:first_name]
    @last_name  = data[:last_name]
    @created_at = data[:created_at]
    @updated_at = data[:updated_at]
    @repo       = repo
  end

  def invoices
    # binding.pry
    repo.all_invoices(id)
  end
end
