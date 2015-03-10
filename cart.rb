class Cart
  def initialize
    @cart = {}
  end

  def save
    @cart << self
    self
  end

  def products
    @cart
  end

  def add(product)
    unless @cart[product]
      @cart[product] = 0
    end
    @cart[product] += 1
  end

  def delete(product)
    @cart[product] -= 1
    @cart.delete_if { |product, count_product| count_product == 0 }
  end

  def total_price
    @price = 0
    @cart.each do |product, count_product|
      @price += product.price * count_product
    end
    @price
  end

  def delete_all
    @cart = {}
  end
end
