require './product'
require './cart'
require './order'
require './product_controller'
require './cart_controller'
require './order_controller'
require './controller'

class Store
  def call(env)
    request = Rack::Request.new(env)
    case request.path
      when "/"
        env['action'] = 'all'
        ProductController.new.call(env)
      when "/cart"
        if request.post?
          env['session']['cart'] ||= Cart.new
          case
            when request.params["product_name"]
              env['product_name'] = request.params["product_name"]
              CartController.new(env).cart_post_add
            when request.params["delete_product"]
              env['delete_product'] = request.params["delete_product"]
              CartController.new(env).cart_post_delete_product
            when request.params["delete_all_products"]
              env['delete_all_products'] = request.params["delete_all_products"]
              CartController.new(env).cart_post_delete_all_products
          end
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
        env['action'] = 'one_product'
        env['url_params'] = {'name' => $1}
        ProductController.new.call(env)
    end
  end
end
