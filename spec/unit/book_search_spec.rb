require "spec_helper"
require File.expand_path("../../app/book_search", File.dirname(__FILE__))

describe BookSearch do
	let(:api_info)		 { double("vacuum object") }
	let(:api_body)		 { File.read(File.join(File.dirname(__FILE__), "../support/api_response.xml")) }
  let(:api_response) { double("response object", body: api_body) }	
	subject { BookSearch.new(api_info) }

	it { should respond_to :search }

	describe "#search" do
		it "should return xml" do
			expect { subject.search(:api_info) }.to eq(api_response)
		end
	end
end
