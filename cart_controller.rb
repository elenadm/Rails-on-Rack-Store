class CartController
  def initialize(env)
    @env = env
  end

  def cart_post
    @env['session']['cart'] ||= Cart.new
    cart = @env['session']['cart']
    pr_name = @env['product_name']
    cart.add(pr_name)
    [200, {"Content-Type" => "text/html"}, [cart.to_html]]
  end

  def cart_get
    [200, {"Content-Type" => "text/html"}, [@env['session'].to_s, Product.to_html]]
  end
end
