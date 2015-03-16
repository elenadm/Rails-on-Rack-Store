require_relative 'spec_helper'
require_relative '../cart.rb'

describe Cart do

  let(:cart) { described_class.new }
  let(:product1) { Product.new("Name1", 12, "/Name1.jpg") }
  let(:product2) { Product.new("Name2", 20, "/Name2.jpg") }

  it 'add product1 to cart' do
    expect { cart.add(product1.save) }.to change { cart.products }.from({}).to({product1 => 1})
  end

  it 'add two products1 and product2 to cart' do
    expect { cart.add(product1.save); cart.add(product2.save); cart.add(product1.save) }.to change { cart.products }.from({}).to({product1 => 2, product2 => 1})
  end

  it 'delete from cart product1' do
    cart.add(product1.save)
    cart.add(product1.save)
    expect { cart.delete(product1) }.to change { cart.products }.from({product1 => 2}).to({product1 => 1})
  end

  it 'delete from cart all products' do
    cart.add(product1.save)
    cart.add(product1.save)
    cart.add(product2.save)
    expect { cart.delete_all }.to change { cart.products }.from({product1 => 2, product2 => 1}).to({})
  end

  it 'total price of product1 in cart' do
    expect { cart.add(product1.save) }.to change { cart.total_price }.from(0).to(12)
  end

  it 'total price of products in cart' do
    expect { cart.add(product1.save); cart.add(product2.save) }.to change { cart.total_price }.from(0).to(32)
  end

  it 'total price for empty cart' do
    expect(cart.total_price).to eq(0)
  end
end
