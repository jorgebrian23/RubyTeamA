
require 'json/ext'
require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/me_details'
require_relative '../../../src/helpers/data_helper'

When(/^I send a (GET) request to (.*?)$/) do |method, end_point|
	http_request = @client.get_request(method, end_point)
	@http_response = @client.execute_request(@http_connection, http_request)
	@http_response.body
  puts DataHelper.getJson(@http_response.body)
  # object = DataHelper.rehash_to_symbol_keys(json)
  # me_details = MeDetails.new(object)
  # puts me_details.email
end



# When(/^I send a (PUT|POST) request to (.*?) with json$/) do |method, end_point, json_text|
# 	http_request = @client.get_request(method, end_point)
# 	http_request['content-type'] = 'application/json'
# 	http_request['accept'] = 'application/json'
# 	http_request.body = json_text
# 	@http_response = @client.execute_request(@http_connection, http_request)
# 	puts DataHelper.getJson(@http_response.body)
# end
