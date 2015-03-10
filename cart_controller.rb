require './controller'

class CartController  < Controller
  def cart_post_add
    @env['session']['cart'] ||= Cart.new
    cart = @env['session']['cart']
    pr_name = Product.find(params['product_name'])
    cart.add(pr_name)
    @cart = cart
    render './cart.html.erb'
  end

  def cart_post_delete_product
    cart = @env['session']['cart']
    cart.delete(Product.find(params['delete_product']))
    @cart = cart
    render './cart.html.erb'
  end

  def cart_post_delete_all_products
    cart = @env['session']['cart']
    cart.delete_all
    @cart = cart
    render './cart.html.erb'
  end

  def cart_get
    @products = Product.all
    render './products.html.erb'
  end
end
