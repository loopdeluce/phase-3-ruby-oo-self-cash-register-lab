require 'Pry'

class CashRegister

  attr_reader :discount
  attr_accessor :total, :items, :last_item_added

  def initialize(discount = 1)
    if discount
      @discount = discount
    end
    @total = 0
    @items = []
    @last_item_added = []
  end

  def add_item(item, price, quantity = 1)
    quantity.times{ |i| self.items << item}
    self.total += (price * quantity)
    self.last_item_added = price * quantity
  end

  def apply_discount
    if discount == 1
      "There is no discount to apply."
    else
      discounted_price = total * (1-(discount.to_f/100))
      self.total = discounted_price
      discounted_price_int = discounted_price.to_i
      "After the discount, the total comes to $#{discounted_price_int}."
    end
    
  end

  def void_last_transaction
    self.total -= last_item_added
  end

end

cashy = CashRegister.new(20)
cashy.add_item("book", 5.00, 2)
cashy.add_item("tomato", 1.76)
cashy.void_last_transaction
