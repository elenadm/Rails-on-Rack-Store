require './erb_context.rb'

class Cart
  @@cart = {}

  def save
    @@cart << self
    self
  end

  def products
    @@cart
  end

  def add(product)
    unless @@cart[product]
      @@cart[product] = 0
    end
    @@cart[product] += 1
  end

  def delete(product)
    @@cart[product] -= 1
    @@cart.delete_if { |key, value| value == 0 }
  end

  def sumtotal_price
    @@cart.each do |product, count_product|
      @price = product.price * count_product
    end
    @price
  end

  def delete_all
    @@cart = {}
  end

  def to_html
    context = ERBContext.new(:cart => self)
    Template.new(context).render("./cart.html.erb", "./layout.html.erb")
  end
end
