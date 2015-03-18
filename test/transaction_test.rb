require "./test/test_helper"
require "./lib/transaction"
require "./lib/sales_engine"

class TestTransactions < Minitest::Test

  def test_it_exists
    assert Transaction
  end

  def setup
    sales_engine = SalesEngine.new
    @transaction = sales_engine.transaction_repository.find_by_id(7)
  end

  def test_a_transaction_has_attributes
    assert_equal 7, @transaction.id
    assert_equal 8, @transaction.invoice_id
    assert_equal nil, @transaction.credit_card_expiration_date
    assert_equal "4801647818676136", @transaction.credit_card_number
    assert_equal "success", @transaction.result
    assert_equal "2012-03-27 14:54:10 UTC", @transaction.updated_at
    assert_equal "2012-03-27 14:54:10 UTC", @transaction.created_at
  end

  def test_it_returns_an_invoice
    assert_equal 8, @transaction.invoice.id
  end

  def test_it_has_a_successful_status
    assert @transaction.successful?
  end

end
