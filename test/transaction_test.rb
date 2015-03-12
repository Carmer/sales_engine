require "./test/test_helper"
require "./lib/transaction"

class TestTransactions < Minitest::Test

  def test_it_exists
    assert Transaction
  end

  def setup
    @transactions = Parser.new.parse("./data/", "sample_transactions.csv")
  end

  def test_it_can_instantiate_a_transaction
    data = @transactions[0]
    trans = Transaction.new(data)
    assert trans
  end

  def test_a_transaction_has_an_id
    data = @transactions[0]
    trans = Transaction.new(data)
    assert_equal "1", trans.id
  end

  def test_another_transaction_has_an_id
    data = @transactions[3]
    trans = Transaction.new(data)
    assert_equal "4", trans.id
  end

  def test_a_transaction_has_an_invoice_id
    data = @transactions[3]
    trans = Transaction.new(data)
    assert_equal "5", trans.invoice_id
  end

  def test_another_transaction_has_an_invoice_id
    data = @transactions[10]
    trans = Transaction.new(data)
    assert_equal "12", trans.invoice_id
  end

  def test_a_transation_has_a_credit_card_number
    data = @transactions[10]
    trans = Transaction.new(data)
    assert_equal "4800749911485986", trans.credit_card_number
  end

  def test_another_transaction_has_a_credit_card_number
    data = @transactions[5]
    trans = Transaction.new(data)
    assert_equal "4203696133194408", trans.credit_card_number
  end

  def test_a_transaction_has_a_credit_card_expiration_date
    data = @transactions[5]
    trans = Transaction.new(data)
    assert_equal nil, trans.credit_card_expiration_date
  end

  def test_a_transaction_has_a_result
    data = @transactions[5]
    transaction = Transaction.new(data)
    assert_equal "success", transaction.result
  end

  def test_another_transaction_has_a_result
    data = @transactions[11]
    transaction = Transaction.new(data)
    assert_equal "failed", transaction.result
  end

  def test_a_transaction_has_a_created_at
    data = @transactions[11]
    transaction = Transaction.new(data)
    assert_equal "2012-03-27 14:54:10 UTC", transaction.created_at
  end

  def test_another_transaction_has_a_created_at
    data = @transactions[9]
    transaction = Transaction.new(data)
    assert_equal "2012-03-27 14:54:10 UTC", transaction.created_at
  end

  def test_a_transaction_has_an_updated_at
    data = @transactions[9]
    transaction = Transaction.new(data)
    assert_equal "2012-03-27 14:54:10 UTC", transaction.updated_at
  end

  def test_another_transaction_has_an_upadated_at
    data = @transactions[5]
    transaction = Transaction.new(data)
    assert_equal "2012-03-27 14:54:10 UTC", transaction.updated_at
  end
end
