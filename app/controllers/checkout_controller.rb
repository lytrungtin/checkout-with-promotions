class CheckoutController < ApplicationController
  before_action :set_promotion, :set_checkout_products, only: [:index]

  # GET /checkout/1,2,3/1/
  def index
    co = CheckoutService.new(@promotional_rules)
    basket = ''
    @checkout_product_codes.each do |product_code|
      product = @products.find_by(product_code: product_code)
      co.scan(product)
      basket += product.product_code.to_s + " "
    end
    price = co.total
    render html: "Basket: " + basket + ". Checkout total is: " + "£" + price.to_s
  end

  private

  def set_promotion
    @promotional_rules = Promotion.find_by(code: params[:promotion_code])
  end

  def set_checkout_products
    product_codes = params[:product_codes].split(',')
    @checkout_product_codes = product_codes
    @products = Product.where(:product_code => product_codes)
  end
end
