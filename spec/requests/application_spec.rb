require "spec_helper"
require File.expand_path("../../../app/application", __FILE__)

describe Application, :type => :feature do
	let(:request) { Rack::MockRequest.new(Application) }
	subject { request }
	
	it "/ returns Index Page" do
		expect { request.get("/").body }.to have_selector "form" 
	end
end
