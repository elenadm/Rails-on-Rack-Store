#\ -p 8080
require './store'
require './middleware/check_exception'
require './middleware/session'
require './middleware/static'

name_path_public = File.dirname(__FILE__) + "/public" # __dir__ + "/public"

use Rack::Reloader, 0
use Check_exception
use Static, name_path_public
use Session


run Store.new
