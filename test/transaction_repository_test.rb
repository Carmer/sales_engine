require "./test/test_helper"
require "./lib/transaction_repository"

class TransactionRepositoryTest < Minitest::Test

  def test_it_exists
    assert TransactionRepository
  end

  def setup
    @transaction_data = Parser.new.parse("./data/", "sample_transactions.csv")
  end

  def test_it_creates_an_array_of_invoice_objects
    trans = TransactionRepository.new(@transaction_data).transactions
    assert_equal 19, trans.size
    assert_equal Array, trans.class
  end
end
