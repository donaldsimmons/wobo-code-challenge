require "haml"
require "vacuum"
require "./app/controllers/searches_controller"

class ApplicationController
	def self.call(env)
		new(env).response.finish
	end

	def initialize(env)
		@request = Rack::Request.new(env)
		@api_object = Vacuum.new.configure({
	    "aws_access_key_id" 		=> "AKIAISKMDJ5IH3UVK4OQ",
			"aws_secret_access_key" => "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",
		  "associate_tag"				  => "dpsimmons-20"	
		})
	end  

	def response
		case @request.path
			when "/"      then Rack::Response.new(render("index.html.haml"))
			when "/books" then
				book_search = SearchesController.new(@api_object)
				results = book_search.search(@request.params["book_title"])
				Rack::Response.new(render("books.html.haml", results))
			else Rack::Response.new("None Found", 404)
		end
	end

	def render(template, template_data = {})
		path = File.expand_path("../../views/#{template}", __FILE__)
		Haml::Engine.new(File.read(path)).render(Object.new, data: template_data) 
	end
end
