require './product'

class Store
  def call(env)
    request = Rack::Request.new(env)
    #raise 34 #error
    case request.path
      when "/"
        [200, {"Content-Type" => "text/html"}, [env['session'].to_s, Product.to_html]]
      when "/cart"
        if request.post?
          [200, {"Content-Type" => "text/html"}, [env['session'].to_s]]
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
