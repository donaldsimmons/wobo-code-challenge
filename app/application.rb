require "haml"

class Application
	def call(env)
		@request = Rack::Request.new(env)
    
		case @request.path
			when "/" then Rack::Response.new(render("index.html.haml"))
		end
	end

	def render(template)
		path = File.expand_path("../views/#{template}", __FILE__)
		Haml::Engine.new(File.read(path)).render
	end
end
