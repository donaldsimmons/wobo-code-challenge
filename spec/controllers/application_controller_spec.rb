require "spec_helper"
require File.expand_path("../app/controllers/application_controller", "__FILE__")

describe "ApplicationController" do
	let(:env) { double("env object") }
	before { @app_controller = ApplicationController.new(env) }

	it "has call class method" do
		expect(ApplicationController).to respond_to :call
	end	
 
 	it "has render method" do
		expect(@app_controller).to respond_to :render
	end

	it "has response message" do
		expect(@app_controller).to respond_to :response
	end

  describe "#response" do
		context "when receiving no query path" do
				
		end

		context "when receiving books path" do
			
		end

		context "when receiving invalid path" do
			
		end
	end
end
