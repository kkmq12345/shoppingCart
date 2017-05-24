class ShoppingCart  
  cart_items = {"Unlimited 1GB" => 0, "Unlimited 2GB" => 0, 
    "Unlimited 5GB" => 0, "1GB Data-pack" => 0}
  total_cost = 0
  discount = false
  promo_date_start = DateTime.new(2017, 05, 23) + 30.days

  def add(item, promo_code=false)
    discount = true if promo_code == "I<3AMAYSIM"

    cart_items.update("Unlimited 1GB"=>+1) if item == "ult_small"
    cart_items.update("Unlimited 2GB"=>+1) if item == "ult_medium"
    cart_items.update("Unlimited 5GB"=>+1) if item == "ult_large"
    cart_items.update("1GB Data-pack"=>+1) if item == "1gb"

    puts "#{item} added\n"
    puts "Promo Applied\n" if discount
  end

  def total
    cart_items.each do |item, number|
      if promo_date_start > DateTime.now
        total_cost += (number - number/3) * 24.9 if item == "Unlimited 1GB"
        if item = "Unlimited 5GB"  && number > 3
          total_cost += number * 39.9
        elsif item = "Unlimited 5GB"
          total_cost += number * 44.9
        end
      else
        total_cost += number * 24.9 if item == "Unlimited 1GB"
        total_cost += number * 44.9 if item == "Unlimited 5GB"
      end
      total_cost += number * 29.9 if item == "Unlimited 2GB"
      total_cost += number * 9.9 if item == "1GB Data-pack"
    end
    total_cost = total_cost * 0.9 if discount
    puts "Total Cost: $#{'%.02f' % total_cost}\n"
  end

  def items
    checkout_items = cart_items
    checkout_items.update("1GB Data-pack"=>+checkout_items["Unlimited 2GB"])
    puts "Items in Cart:\n"
    checkout_items.each do |item, number|
      puts "#{number} x #{item}\n" if number > 0 
    end
    check_out_items
  end
end