class CheckoutService
  attr_reader :total

  def initialize(promotional_rules)
    @min_total_price = promotional_rules[:min_total_price]
    @discount_rate = promotional_rules[:discount_rate]
    @includes_discount_item = promotional_rules[:includes_discount_item]
    @total_price = 0
    @item_added = Array.new
  end

  def scan(item)
    begin
      item_price = calculate_item_price(item)
      @total_price += item_price
      @total = if @total_price >= @min_total_price
          @total_price * (1 - @discount_rate* 0.01)
        else
          @total_price
        end
    rescue
      false
    end
  end

  private

  def calculate_item_price(item)
    @item_added  << item.product_code
    quantity = @item_added.count(item.product_code)
    if @includes_discount_item == true && item.quantity_discount.present? && quantity >= item.quantity_discount.to_i
      price_discount = item.price_discount
      if quantity == item.quantity_discount.to_i #This is condition for action discount for item price has been scanned before.
        price_discount -= (item.price - item.price_discount) * (quantity - 1)
      end
      price_discount
    else
      item.price
    end
  end
end