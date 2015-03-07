require './controller'

class ProductController < Controller
  def all
    @products = Product.all
    render './products.html.erb'
  end

  def one_product
    @product = Product.find(params['name'])
    if @product
      render './product.html.erb'
    else
      @body = 'Product not found'
      @code = 404
    end
  end
end
