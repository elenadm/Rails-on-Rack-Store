require './product'

class Store
  def call(env)
    q = env['QUERY_STRING']
    name = q.split('=').last
    if name
      [200, {}, [Product.find(name).to_html]]
    else
      [200, {"Content-Type" => "text/html"}, [Product.to_html, 'What name you are looking for?<form><input name="name"><input type="submit"></form>']]
    end
  end
end
