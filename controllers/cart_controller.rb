require_relative 'controller'
require_relative '../cart'

class CartController < Controller
  def cart_post_add
    pr_name = Product.find(params['product_name'])
    cart.add(pr_name)
    redirect_to('/')
  end

  def cart_post_delete_product
    cart.delete(Product.find(params['delete_product']))
    redirect_to('/cart')
  end

  def cart_post_delete_all_products
    cart.delete_all
    redirect_to('/cart')
  end

  def cart_get
    @cart = cart
    render 'cart.html.erb'
  end

  private

  def cart
    session['cart'] ||= Cart.new
  end
end
