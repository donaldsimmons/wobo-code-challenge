require "spec_helper"
require File.expand_path("../../app/book_search", File.dirname(__FILE__))

describe BookSearch do
	let(:api_info)		 { double("vacuum object") }
	let(:api_body)		 { File.read(File.join(File.dirname(__FILE__), "../support/api_response.xml")) }
  let(:api_response) { double("response object", body: api_body) }	
	subject { BookSearch.new(api_info) }

	it { should respond_to :search }

	it "should return data from API" do
		api_info.should_receive(:get) do |api_params|
			expect { api_params[:query] }.to eq({
				Operation:     "ItemSearch",
				SearchIndex:   "Books",
				Keywords:      "game of thrones",
				ResponseGroup: "ItemAttributes,Images"
			})
			api_response
		end
		subject.search("game of thrones")
	end
end
