require './store'
require './check_exception'
use Rack::Reloader
use Check_exception

Product.new("blouse", 30).save
Product.new("dress", 50).save
Product.new("hat", 40).save
Product.new("jacket", 55).save
Product.new("jumper", 25).save
Product.new("shirt", 20).save

run Store.new
