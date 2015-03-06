class CartController
  def initialize(env)
    @env = env
  end

  def cart_post
    @env['session']['cart'] ||= Cart.new
    cart = @env['session']['cart']
    if @env['product_name']
      pr_name = Product.find(@env['product_name'])
      cart.add(pr_name)
      [200, {"Content-Type" => "text/html"}, [cart.to_html]]
    elsif @env['delete_product']
      cart.delete(Product.find(@env['delete_product']))
      [200, {"Content-Type" => "text/html"}, [cart.to_html]]
    elsif @env['delete_all_products']
      cart.delete_all
      [200, {"Content-Type" => "text/html"}, [@env['session'].to_s, Product.to_html]]
    end
  end

  def cart_get
    [200, {"Content-Type" => "text/html"}, [@env['session'].to_s, Product.to_html]]
  end
end
