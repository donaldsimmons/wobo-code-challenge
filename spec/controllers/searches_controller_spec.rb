require "spec_helper"
require "vacuum"
require File.expand_path("../app/controllers/searches_controller", "__FILE__")

describe SearchesController do
	let(:api_object) { Vacuum.new }
	before { @searches_controller = SearchesController.new(api_object) }

	it "has a search method" do
		expect(@searches_controller).to respond_to :search
	end

	describe "#search" do
		let(:api_object)   { Vacuum.new }
		let(:api_body)		 { File.read(File.join(File.dirname(__FILE__), "../support/api_response.xml")) }
		let(:api_response) { double("response object", body: api_body) }
		let(:search_query) { "game of thrones" }
		subject { @searches_controller }

		it "returns array of matched items" do
			params = {
				"Operation" => "ItemSearch",
				"SearchIndex" => "Books",
				"Keywords" => search_query,
				"ResponseGroup" => "ItemAttributes,Images"
			}
			api_object.stub(:get).with(query: params).and_return(api_response)
			expect(subject.search("game of thrones")).to be_an_instance_of(Array)
		end
	end
end
