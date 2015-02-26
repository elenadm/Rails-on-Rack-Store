#\ -p 8080
require './store'
require './middleware/check_exception'
require './middleware/session'
require './middleware/static'

use Check_exception
use Static
use Session
use Rack::Reloader, 0

run Store.new
