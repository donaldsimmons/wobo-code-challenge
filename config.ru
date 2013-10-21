require ::File.expand_path("app/application", File.dirname(__FILE__)) 

use Rack::Reloader, 0

run Application.new
