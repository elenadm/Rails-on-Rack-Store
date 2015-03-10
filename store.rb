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
        else
          env['action'] = 'cart_get'
        end
        CartController.new.call(env)
      when '/order'
        if request.post?
          if request.params['delete_all_orders']
            env['action'] = 'order_post_delete_all_orders'
          else
            env['url_params'] = {'name' => request.params['name'], 'address' => request.params['address'], 'phone' => request.params['phone']}
            env['action'] = 'order_post'
          end
        else
          env['action'] = 'order_get'
        end
        OrderController.new.call(env)
      when /^\/(\w+)$/
        env['action'] = 'one_product'
        env['url_params'] = {'name' => $1}
        ProductController.new.call(env)
    end
  end
end
