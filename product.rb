class Product
  @@products = []

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
end
