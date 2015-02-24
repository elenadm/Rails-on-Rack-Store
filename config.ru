#\ -p 8080
require './store'
require './check_exception'
require './session'
require './static'

use Static
use Rack::Reloader, 0
use Session
use Check_exception

run Store.new
