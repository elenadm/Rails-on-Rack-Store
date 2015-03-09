class CartController
  def initialize(env)
    @env = env
  end

  def cart_post_add
    cart = @env['session']['cart']
    pr_name = Product.find(@env['product_name'])
    cart.add(pr_name)
    [302, {"Content-Type" => "text/html"}, [cart.to_html]]
  end

  def cart_post_delete_product
    cart = @env['session']['cart']
    cart.delete(Product.find(@env['delete_product']))
    [302, {"Content-Type" => "text/html"}, [cart.to_html]]
  end

  def cart_post_delete_all_products
    cart = @env['session']['cart']
    cart.delete_all
    [200, {"Content-Type" => "text/html"}, [@env['session'].to_s, Product.to_html]]
  end

  def cart_get
    [200, {"Content-Type" => "text/html"}, [@env['session'].to_s, Product.to_html]]
  end
end
