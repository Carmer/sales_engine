require "./test/test_helper"
require "./lib/transactions"

class TestTransactions < Minitest::Test

  def test_it_exists
    assert Transactions
  end

  def test_it_can_instantiate_a_transaction
    transactions = Parser.new.parse("sample_transactions.csv")
    data = transactions[0]

    transactions.new(data)
    assert transaction
  end
end
