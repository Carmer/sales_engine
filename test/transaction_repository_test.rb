require "./test/test_helper"
require "./lib/transaction_repository"
require "./lib/sales_engine"

class TransactionRepositoryTest < Minitest::Test

  def test_it_exists
    assert TransactionRepository
  end

  def setup
    @transaction_objects = SalesEngine.new.transaction_repository
  end

  def test_it_creates_an_array_of_invoice_objects
    assert_equal 999, @transaction_objects.transactions.size
    assert_equal Array, @transaction_objects.transactions.class
  end

  def test_it_can_find_an_item_by_id
    assert_equal "4654405418249632", @transaction_objects.find_by_id("1").credit_card_number
  end

  def test_it_can_find_another_item_by_id
    assert_equal "4580251236515201", @transaction_objects.find_by_id("2").credit_card_number
  end

  def test_it_can_find_an_item_by_invoice_id
    assert_equal "5", @transaction_objects.find_by_invoice_id("6").id
  end

  def test_it_can_find_an_item_by_credit_card_number
    assert_equal "5", @transaction_objects.find_by_credit_card_number("4844518708741275").id
  end

  def test_it_can_find_an_item_by_result
    assert_equal "1", @transaction_objects.find_by_result("success").id
  end

  def test_it_can_find_an_item_by_another_result
    assert_equal "11", @transaction_objects.find_by_result("failed").id
  end

  def test_it_can_find_an_item_by_created_at
    assert_equal "1", @transaction_objects.find_by_created_at("2012-03-27 14:54:09 UTC").id
  end

  def test_it_can_find_an_item_by_updated_at
    assert_equal "1", @transaction_objects.find_by_updated_at("2012-03-27 14:54:09 UTC").id
  end

  def test_it_can_find_all_items_by_id_and_if_none_returns_an_empty_array
    assert_equal "4436110257010678", @transaction_objects.find_all_by_id("19")[0].credit_card_number
    assert_equal [], @transaction_objects.find_all_by_id("1000004")
  end

  def test_it_can_find_all_items_by_credit_card_number
    assert_equal "4436110257010678", @transaction_objects.find_all_by_credit_card_number("4436110257010678")[0].credit_card_number
    assert_equal 1, @transaction_objects.find_all_by_credit_card_number("4436110257010678")[0..1].length
  end

  def test_it_can_find_all_items_by_result
    assert_equal 177, @transaction_objects.find_all_by_result("failed").length
    assert_equal 822, @transaction_objects.find_all_by_result("success").length
  end

  def test_it_can_find_all_items_by_created_at
    assert_equal 20, @transaction_objects.find_all_by_created_at("2012-03-27 14:54:10 UTC").length
  end

  def test_it_can_find_all_items_by_updated_at
    assert_equal 2, @transaction_objects.find_all_by_updated_at("2012-03-27 14:54:09 UTC").length
  end

end
