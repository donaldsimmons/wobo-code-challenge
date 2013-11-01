require "multi_xml"

class SearchesController
	def initialize(api_object)
		@api_object = api_object
	end

	def search(search_keyword)
		search_params = {
		 "Operation" => "ItemSearch",
		 "SearchIndex" => "Books",
		 "Keywords" => search_keyword,
		 "ResponseGroup" => "ItemAttributes,Images"
		}	
		parse_api_response @api_object.get(query: search_params)
	end

	private

		def parse_api_response(api_response)
			parsed_xml = MultiXml.parse(api_response.body)
			result_items = parsed_xml["ItemSearchResponse"]["Items"]["Item"]
		end
end
