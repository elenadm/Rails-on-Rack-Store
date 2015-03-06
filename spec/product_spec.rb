require_relative 'spec_helper'
require_relative '../product.rb'

describe Product do

  before do
    described_class.purge
  end

  let(:product1) { described_class.new("Name1", 12, "/Name1.jpg") } # альтернатива subject
  let(:product2) { described_class.new("Name2", 20, "/Name2.jpg") }

  it "counts product" do
    #expect(described_class.count).to eq(0) #OR  expect(Product.count).to eq(0)
    #product1.save
    #expect(described_class.count).to eq(1)
    # OR
    # expect{Product.new("Name", 12)}.to change { Product.count }.by(1)
    expect { product1.save }.to change { Product.count }.from(0).to(1)
  end

  it "all product" do
    # expect(described_class.all).to eq([])
    # product1.save
    # expect(described_class.all).to eq([product1])
    # product2.save
    # expect(described_class.all).to eq([product1, product2])
    # expect{product2.save}.to change{product.all.include?(product)}.to(true)

    expect { product1.save }.to change { Product.all }.from([]).to([product1])
    expect { product2.save }.to change { described_class.all }.from([product1]).to([product1, product2])
  end

  it "find product" do
    expect { product1.save }.to change { described_class.find("Name1") }.from(nil).to(product1)
  end
end
