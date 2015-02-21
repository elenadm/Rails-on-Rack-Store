#\ -p 8080
require './store'
require './check_exception'
require './session'

use Rack::Static,
    :urls => ["/images", "/js", "/css"],
    :root => "public"
use Rack::Reloader, 0
use Session
use Check_exception

run Store.new
