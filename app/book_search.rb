require 'vacuum'
require 'nokogiri'

class BookSearch
  def initialize(api_info)
		@api_info = api_info
	end

	def search(search_keyword)
  	search_params = {
			Operation:   "ItemSearch",
			SearchIndex: "Books",
			Keywords:    search_keyword,
			ResponseGroup: "ItemAttributes,Images"
		}
		@api_info.get(query: search_params)
	end

	private
		
		def parse_api_response(response)
			parsed_data = Nokogiri::XML(response.body)
		end	
end
