#\ -p 8080
require './store'
require './middleware/check_exception'
require './middleware/session'
require './middleware/static'

name_path_public = __FILE__
name_path_public.gsub!("/config.ru", "/public")

use Check_exception
use Static, name_path_public
use Session
use Rack::Reloader, 0

run Store.new
