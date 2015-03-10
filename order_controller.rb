require './controller'

class OrderController < Controller
  def order
    @env['order']= Order.new(params['name'], params['address'], params['phone'], session['cart'])
    @env['order']
  end

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
    render './order.html.erb'
  end
end
