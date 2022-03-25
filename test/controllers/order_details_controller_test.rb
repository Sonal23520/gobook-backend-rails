require "test_helper"

class OrderDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_detail = order_details(:one)
  end

  test "should get index" do
    get order_details_url, as: :json
    assert_response :success
  end

  test "should create order_detail" do
    assert_difference("OrderDetail.count") do
      post order_details_url, params: { order_detail: { books_id: @order_detail.books_id, orders_id: @order_detail.orders_id, products_id: @order_detail.products_id, qty: @order_detail.qty } }, as: :json
    end

    assert_response :created
  end

  test "should show order_detail" do
    get order_detail_url(@order_detail), as: :json
    assert_response :success
  end

  test "should update order_detail" do
    patch order_detail_url(@order_detail), params: { order_detail: { books_id: @order_detail.books_id, orders_id: @order_detail.orders_id, products_id: @order_detail.products_id, qty: @order_detail.qty } }, as: :json
    assert_response :success
  end

  test "should destroy order_detail" do
    assert_difference("OrderDetail.count", -1) do
      delete order_detail_url(@order_detail), as: :json
    end

    assert_response :no_content
  end
end
