require './layout.rb'
require './erb_context.rb'

class Cart
  extend Layout
  @@cart = [] #{}

  def save
    @@cart << self
    self
  end

  def self.products
    @@cart
  end

  # def inspect
  #   @cart.inspect
  # end

  def add(product)
    @@cart << product
    # if @@cart[product]...
    #   @@cart[product] = 1
    # else
    #   @@cart[product] +=1
    # end
  end

  def delete(product)
    @@cart.delete(product)
  end

  def sultotal_price

  end

  def delete_all
    @@cart = [] #{}
  end

  def self.to_html
    Cart.products
    context = ERBContext.new(:cart => Cart.products)
    render("./layout.html.erb", "./cart.html.erb", context)
  end
end
