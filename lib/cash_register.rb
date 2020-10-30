require 'pry'
class CashRegister
    attr_accessor :discount, :total, :items, :last_item_price
    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
    end

   def add_item(item, price, quantity=1)
    self.total += price * quantity
    quantity.times {@items << item}
    
    @last_item_price = price * quantity
   end

    def apply_discount
        if @discount>0
            percent = @discount/100.0
            self.total -= percent * @total
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
         self.total -= @last_item_price
    end

end