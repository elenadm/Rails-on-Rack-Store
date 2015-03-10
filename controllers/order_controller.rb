require_relative 'controller'
require_relative '../order'

class OrderController < Controller
  def order_post
    order.save
    session['cart'] = nil
    redirect_to('/order')
  end

  def order_post_delete_all_orders
    order.delete_all
    redirect_to('/order')
  end

  def order_get
    @orders = order.all
    render 'order.html.erb'
  end

  private

  def order
    @env['order'] = Order.new(params['name'], params['address'], params['phone'], session['cart'])
  end
end
