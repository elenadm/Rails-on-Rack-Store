require './product'
require './cart'

class Store
  def call(env)
    request = Rack::Request.new(env)
    #raise 34 #error
    case request.path
      when "/"
        [200, {"Content-Type" => "text/html"}, [env['session'].to_s, Product.to_html]]
      when "/cart"
        if request.post?
          env['session']['cart'] ||= Cart.new
          cart = env['session']['cart']
          pr_name = request.params["product_name"]
          cart.add(pr_name)
          [200, {"Content-Type" => "text/html"}, [Cart.to_html]]
        else
          [200, {"Content-Type" => "text/html"}, [env['session'].to_s, Product.to_html]]
        end
      when /^\/(\w+)$/
        pr = Product.find($1)
        if pr
          [200, {"Content-Type" => "text/html"}, [pr.to_html]]
        else
          [404, {"Content-Type" => "text/html"}, ["Product not found"]]
        end
    end
  end
end
