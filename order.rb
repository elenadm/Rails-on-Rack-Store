require './erb_context.rb'

class Order
  @@orders = {}

  attr_reader :name
  attr_reader :address
  attr_reader :phone

  def initialize(name, address, phone)
    @name = name
    @address = address
    @phone = phone
  end

  def delete_all
    @@orders = {}
  end

  def save
    @@orders << self
    self
  end

  def self.all
    @@orders
  end

  def to_html
    context = ERBContext.new(:orders => Order.all)
    Template.new(context).render("./order.html.erb", "./application.html.erb")
  end
end

# def checkout
# 	order = Order.new
# 	order.name = name
#   скопировать товары
# 	очистить товары
# 	order.save
# end
