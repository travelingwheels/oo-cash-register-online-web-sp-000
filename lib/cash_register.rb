class CashRegister
  
  attr_accessor :total, :discount
  
  def initialize(discount = 20)
    @total = 0.00
    @discount = discount
    @cart = []
  end
  
  def add_item(item, price, quantity = 1)
    item_info = {}
    item_info[:name] = item
    item_info[:price] = price
    item_info[:quantity] = quantity

    @cart << item_info

    @total += price * quantity
  end
  
  def apply_discount
   if discount != 0
      self.total = (total * ((100.0 - discount.to_f)/100)).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      return "There is no discount to apply."
    end
  end
  
  def items
    item_names = []
    @cart.each do | item_info |
      for qty in 1..item_info[:quantity] 
        item_names << item_info[:name]
      end 
    end 
    item_names
  end 
  
   def void_last_transaction
    self.total -= self.total.pop
  end
end
