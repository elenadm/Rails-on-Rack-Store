require_relative 'controller'
require_relative '../product'

class ProductController < Controller
  def all
    @time_visit = session['time_visit']
    @counter = session['counter']
    @products = Product.all
    render 'products.html.erb'
  end

  def one_product
    @product = Product.find(params['name'])
    if @product
      render 'product.html.erb'
    else
      @body = 'Product not found'
      @code = 404
    end
  end
end
