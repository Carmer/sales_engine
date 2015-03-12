require "./test/test_helper"
require "./lib/transaction"

class TestTransactions < Minitest::Test

  def test_it_exists
    assert Transaction
  end

  def test_it_can_instantiate_a_transaction
    transactions = Parser.new.parse("./data/", "sample_transactions.csv")
    data = transactions[0]

    transaction = Transaction.new(data)
    assert transaction
  end

  def test_a_transaction_has_an_id
    transactions = Parser.new.parse("./data/", "sample_transactions.csv")
    data = transactions[0]

    transaction = Transaction.new(data)
    assert_equal "1", transaction.id
  end

  def test_another_transaction_has_an_id
    transactions = Parser.new.parse("./data/", "sample_transactions.csv")
    data = transactions[3]

    transaction = Transaction.new(data)
    assert_equal "4", transaction.id
  end

  def test_a_transaction_has_an_invoice_id
    transactions = Parser.new.parse("./data/", "sample_transactions.csv")
    data = transactions[3]

    transaction = Transaction.new(data)
    assert_equal "5", transaction.invoice_id
  end

  def test_another_transaction_has_an_invoice_id
    transactions = Parser.new.parse("./data/", "sample_transactions.csv")
    data = transactions[10]

    transaction = Transaction.new(data)
    assert_equal "12", transaction.invoice_id
  end

  def test_a_transation_has_a_credit_card_number
    transactions = Parser.new.parse("./data/", "sample_transactions.csv")
    data = transactions[10]

    transaction = Transaction.new(data)
    assert_equal "4800749911485986", transaction.credit_card_number
  end

  def test_another_transaction_has_a_credit_card_number
    transactions = Parser.new.parse("./data/", "sample_transactions.csv")
    data = transactions[5]

    transaction = Transaction.new(data)
    assert_equal "4203696133194408", transaction.credit_card_number
  end

  def test_a_transaction_has_a_credit_card_expiration_date
    transactions = Parser.new.parse("./data/", "sample_transactions.csv")
    data = transactions[5]

    transaction = Transaction.new(data)
    assert_equal nil, transaction.credit_card_expiration_date
  end

  def test_a_transaction_has_a_result
    transactions = Parser.new.parse("./data/", "sample_transactions.csv")
    data = transactions[5]

    transaction = Transaction.new(data)
    assert_equal "success", transaction.result
  end

  def test_another_transaction_has_a_result
    transactions = Parser.new.parse("./data/", "sample_transactions.csv")
    data = transactions[11]

    transaction = Transaction.new(data)
    assert_equal "failed", transaction.result
  end

  def test_a_transaction_has_a_created_at
    transactions = Parser.new.parse("./data/", "sample_transactions.csv")
    data = transactions[11]

    transaction = Transaction.new(data)
    assert_equal "2012-03-27 14:54:10 UTC", transaction.created_at
  end

  def test_another_transaction_has_a_created_at
    transactions = Parser.new.parse("./data/", "sample_transactions.csv")
    data = transactions[9]

    transaction = Transaction.new(data)
    assert_equal "2012-03-27 14:54:10 UTC", transaction.created_at
  end

  def test_a_transaction_has_an_updated_at
    transactions = Parser.new.parse("./data/", "sample_transactions.csv")
    data = transactions[9]

    transaction = Transaction.new(data)
    assert_equal "2012-03-27 14:54:10 UTC", transaction.updated_at
  end

  def test_another_transaction_has_an_upadated_at
    transactions = Parser.new.parse("./data/", "sample_transactions.csv")
    data = transactions[5]

    transaction = Transaction.new(data)
    assert_equal "2012-03-27 14:54:10 UTC", transaction.updated_at
  end
end
