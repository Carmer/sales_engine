require "./test/test_helper"
require "./lib/transaction_repository"

class TransactionRepositoryTest < Minitest::Test

  def test_it_exists
    assert TransactionRepository
  end

  def test_it_creates_an_array_of_invoice_objects
    transaction_data = Parser.new.parse("./data/", "sample_transactions.csv")

    transaction_data = TransactionRepository.new(transaction_data).transactions
    assert_equal 19, transaction_data.size
    assert_equal Array, transaction_data.class
  end
end
