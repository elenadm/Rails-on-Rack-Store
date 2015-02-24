require './layout.rb'

class Product
  include Layout
  @@products = []

  attr_reader :name
  attr_reader :price
  attr_reader :img

  def initialize(name, price, img)
    @name = name
    @price = price
    @img = img
  end

  def save
    @@products << self
    self
  end

  def self.count
    @@products.size
  end

  def self.all
    @@products
  end

  def self.purge
    @@products = []
  end

  def self.find (name)
    @@products.detect { |e| e.name == name }
  end

  def to_html
    layout do
      "<p><a href='http://localhost:8080/#{self.name}'>#{self.name}:   #{self.price}  <img src='#{self.img}' width='100' height='100' ></p>"
    end
  end

  def self.to_html
    @@products.reduce('') { |list, e| list + e.to_html }
  end
end

Product.new("blouse", 30, "blouse.jpg").save
Product.new("dress", 50, "dress.jpg").save
Product.new("hat", 40, "hat.jpg").save
Product.new("jacket", 55, "jacket.jpg").save
Product.new("jumper", 25, "jumper.jpg").save
Product.new("shirt", 20, "shirt.jpg").save
