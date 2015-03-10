require './erb_context.rb'

class Order
  @@orders = []

  attr_reader :name
  attr_reader :address
  attr_reader :phone
  attr_reader :cart

  def initialize(name, address, phone, cart)
    @name = name
    @address = address
    @phone = phone
    @cart = cart
  end

  def delete_all
    @@orders = []
  end

  def save
    @@orders << self
    self
  end

  def all
    @@orders
  end

  def to_html
    context = ERBContext.new(:orders => @@orders)
    Template.new(context).render('./order.html.erb', './application.html.erb')
  end
end

# def checkout
# 	order = Order.new
# 	order.name = name
#   скопировать товары
# 	очистить товары
# 	order.save
# end
