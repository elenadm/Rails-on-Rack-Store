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
      when '/'
        env['action'] = 'all'
        ProductController.new.call(env)
      when '/cart'
        if request.post?
          if request.params['product_name']
            env['url_params'] = {'product_name' => request.params['product_name']}
            env['action'] = 'cart_post_add'
          elsif request.params['delete_product']
            env['url_params'] = {'delete_product' => request.params['delete_product']}
            env['action'] = 'cart_post_delete_product'
          elsif request.params['delete_all_products']
            env['url_params'] = {'delete_all_products' => request.params['delete_all_products']}
            env['action'] = 'cart_post_delete_all_products'
          end
          CartController.new.call(env)
        else
          env['action'] = 'all'
          ProductController.new.call(env)
          # env['action'] = 'cart_get'
          # CartController.new.call(env)
        end
      when '/order'
        if request.post?
          env['order'] = Order.new(request.params['name'], request.params['address'], request.params['phone'])
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
