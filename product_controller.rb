class ProductController
  def initialize(env)
    @env = env
  end

  def all
    [200, {"Content-Type" => "text/html"}, [@env['session'].to_s, Product.to_html]]
  end

  def one_product
    pr = Product.find(@env['name'])
    if pr
      [200, {"Content-Type" => "text/html"}, [pr.to_html]]
    else
      [404, {"Content-Type" => "text/html"}, ["Product not found"]]
    end
  end
end
