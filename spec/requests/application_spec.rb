require "spec_helper"
require "haml"
require File.expand_path("../../../app/application", __FILE__)

describe Application, :type => :feature do
	before do
	 	@request = Rack::MockRequest.new(Application)
	end

	it "renders search form when given root url" do
		@request.get("/").body.must_include "Search for Books"
	end

	it "returns results page with /books" do
		expect { request.get("/books").body }.to have_text "Search Results"
	end
end
