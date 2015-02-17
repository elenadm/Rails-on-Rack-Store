require './product'

class Store
  def call(env)
    q = env['QUERY_STRING']
    name = q.split('=').last
    if name
      pr = Product.find(name)
      if pr
        [200, {"Content-Type" => "text/html"}, [pr.to_html]]
      else
        [404, {"Content-Type" => "text/html"}, ["Product not found"]]
      end
    else
      [200, {"Content-Type" => "text/html"}, [Product.to_html, 'What name you are looking for?<form><input name="name"><input type="submit"></form>']]
    end
  end
end
