class CheckoutController < ApplicationController
  before_action :set_promotion, :set_checkout_products, only: [:index]

  # GET /checkout/1,2,3/1/
  def index
    co = CheckoutService.new(@promotional_rules)
    basket = ''
    @checkout_product_ids.each do |product_id|
      product = @products.find(product_id)
      co.scan(product)
      basket += product.product_code.to_s + " "
    end
    price = co.total
    render html: "Basket: " + basket + ". Checkout total is: " + "£" + price.to_s
  end

  private

  def set_promotion
    @promotional_rules = Promotion.find(params[:promotion_id])
  end

  def set_checkout_products
    ids = params[:product_ids].split(',')
    @checkout_product_ids = ids
    @products = Product.where(:id => ids)
  end
end
