require './erb_context.rb'

class Cart
  @@cart = [] #{}

  def save
    @@cart << self
    self
  end

  def self.products
    @@cart
  end

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

  def to_html
    context = ERBContext.new(:cart => Cart.products)
    Template.new(context).render("./cart.html.erb","./layout.html.erb")
  end
end
