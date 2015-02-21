require './layout.rb'

class Product
  include Layout
  @@products = []

  attr_reader :name
  attr_reader :price

  def initialize(name, price)
    @name = name
    @price = price
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
      "<p><a href='http://localhost:8080/#{self.name}'>#{self.name}:   #{self.price}</p>"
    end
  end

  def self.to_html
    @@products.reduce('') { |list, e| list + e.to_html }
  end
end

Product.new("blouse", 30).save
Product.new("dress", 50).save
Product.new("hat", 40).save
Product.new("jacket", 55).save
Product.new("jumper", 25).save
Product.new("shirt", 20).save
