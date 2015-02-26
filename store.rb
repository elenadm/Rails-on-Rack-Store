require './product'

class Store
  def call(env)
    request = Rack::Request.new(env)
    name = request.path.split('/')[-1]
    #raise 34 #error
    if name
      pr = Product.find(name)
      if pr
        [200, {"Content-Type" => "text/html"}, [pr.to_html]]
      else
        [404, {"Content-Type" => "text/html"}, ["Product not found"]]
      end
    else
      [200, {"Content-Type" => "text/html"}, [env['session'].to_s, Product.to_html]]
    end
  end
end
