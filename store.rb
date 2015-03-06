require './product'
require './cart'
require './order'
require './product_controller'
require './cart_controller'
require './order_controller'

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
          env['delete_product'] = request.params["delete_product"]
          env['delete_all_products'] = request.params["delete_all_products"]
          CartController.new(env).cart_post
        else
          CartController.new(env).cart_get
        end
      when "/order"
        if request.post?
          env['order'] = Order.new(request.params["name"],request.params["address"],request.params["phone"])
          #p @env['session']['cart'] = nil
          OrderController.new(env).order_post
        else
          OrderController.new(env).order_get
        end
      when /^\/(\w+)$/
        env['name'] = $1
        #env['QUERY_INFO'] = "name = #{$1}"
        ProductController.new(env).one_product
    end
  end
end
