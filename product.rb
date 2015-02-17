class Product
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
    "<p>#{self.name}:   #{self.price}</p>"
  end

  def self.to_html
    @@products.reduce('') { |list, e| list + e.to_html }
  end
end
