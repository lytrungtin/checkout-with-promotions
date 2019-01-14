require 'test_helper'

class CheckoutControllerTest < ActionDispatch::IntegrationTest
  setup do
    @promotion = promotions(:one)
    @product = products(:one)
    post promotions_url, params: { promotion: { code: 'KM3', discount_rate: @promotion.discount_rate, includes_discount_item: @promotion.includes_discount_item, min_total_price: @promotion.min_total_price } }
    post products_url, params: { product: { name: @product.name, price: @product.price, price_discount: @product.price_discount, product_code: '003', quantity_discount: @product.quantity_discount } }
  end

  test "should get index" do
    get '/checkout/003/KM3'
    assert_response :success
  end

end
