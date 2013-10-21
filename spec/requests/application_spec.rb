require "spec_helper"
require "haml"
require File.expand_path("../../../app/application", __FILE__)

describe Application, :type => :feature do
	let(:request) { Rack::MockRequest.new(Application) }
	subject { request }
	
	it "/ returns index page" do
		expect { request.get("/").body }.to have_content "Search for Books"
	end

	it "returns results page with /books" do
		expect { request.get("/books").body }.to have_content "Book Results"
	end
end
