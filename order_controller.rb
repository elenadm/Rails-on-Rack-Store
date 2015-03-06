class OrderController
  def initialize(env)
    @env = env
  end

  def order_post
    [200, {'Content-type' => 'text/html'}, [@env['order'].to_html]]
  end

  def order_get
    [200, {"Content-Type" => "text/html"}, [@env['session'].to_s, Product.to_html]]
  end
end
