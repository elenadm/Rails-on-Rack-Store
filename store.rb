require './product'
require './cart'
require './product_controller'
require './cart_controller'

class Store
  def call(env)
    request = Rack::Request.new(env)
    #raise 34 #error
    case request.path
      when "/"
        ProductController.new(env).all
      when "/cart"
        if request.post?
          env['product_name'] = request.params["product_name"]
          CartController.new(env).cart_post
        else
          CartController.new(env).cart_get
        end
      when /^\/(\w+)$/
        env['name'] = $1
        #env['QUERY_INFO'] = "name = #{$1}"
        ProductController.new(env).one_product
    end
  end
end
