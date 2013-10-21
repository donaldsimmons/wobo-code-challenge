require "haml"

class Application
	def self.call(env)
		new(env).response.finish
	end

	def initialize(env)
		@request = Rack::Request.new(env)
	end  

	def response
		case @request.path
			when "/" then Rack::Response.new(render("index.html.haml"))
			when "/books" then Rack::Response.new(render("books.html.haml"))
			else Rack::Response.new("None Found", 404)
		end
	end

	def render(template)
		path = File.expand_path("../views/#{template}", __FILE__)
		Haml::Engine.new(File.read(path)).render
	end
end
