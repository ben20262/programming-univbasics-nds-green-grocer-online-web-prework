def find_item_by_name_in_collection(name, collection)
  # Implement me first!
  #
  # Consult README for inputs and outputs
  collection.each do |food|
    if food[:item] == name
      return food
    end
  end
  nil
end

def consolidate_cart(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This returns a new Array that represents the cart. Don't merely
  # change `cart` (i.e. mutate) it. It's easier to return a new thing.
  array = []
  cart.each do |food1|
    counter = 0
    cart.each do |food2|
      if food1 == food2
        counter += 1
      end
    end
    food1[:count] = counter
    if array.include?(food1) == false
      array << food1
    end
  end
  array
end

def apply_coupons(cart, coupons)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  coupons.each do |ticket|
    counter = 0
    cart.each do |food|
      if food[:item] == ticket[:item] && food[:count] >= ticket[:num]
        cart << {
          :item => food[:item] + " W/COUPON",
          :price => ticket[:cost] / ticket[:num],
          :clearance => food[:clearance],
          :count => ticket[:num]
        }
        cart[counter][:count] = food[:count] - ticket[:num]
      end
      counter += 1
    end
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
  counter = 0
  cart.each do |food|
    if food[:clearance]
      cart[counter][:price] *= 0.8
    end
    counter += 1
  end
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  puts cart
  total = 0
  smol_cart = consolidate_cart(cart)
  apl_cart = apply_coupons(smol_cart, coupons)
  final_cart = apply_clearance(apl_cart)
  puts final_cart
  final_cart.each do |food|
    total += food[:price] * food[:count]
  end
  if total > 100
    total *= 0.9
  end
  total
end
