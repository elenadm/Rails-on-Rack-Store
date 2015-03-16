require_relative 'spec_helper'
require_relative '../order.rb'

describe Order do

  before { order.delete_all }
  let(:order) { Order.new('NameBuyer', 'City', '123456', cart) }
  let(:cart) { Cart.new }
  let(:product1) { Product.new('Name1', 12, '/Name1.jpg') }
  before { cart.add(product1.save) }


  it 'get order' do
    expect { order.save }.to change { order.all }.from([]).to([order])
  end

  it 'delete all orders' do
    order.save
    expect { order.delete_all }.to change { order.all }.from([order]).to([])
  end
end
