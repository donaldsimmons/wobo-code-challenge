require ::File.expand_path("app/controllers/application_controller", File.dirname(__FILE__)) 

use Rack::Reloader, 0

run ApplicationController
