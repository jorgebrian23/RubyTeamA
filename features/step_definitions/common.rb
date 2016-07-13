require 'json/ext'
require_relative '../../src/helpers/rest_client/api_rest_client'
require_relative '../../src/data/epic'
require_relative '../../src/helpers/data_helper'
require_relative '../../src/helpers/data_helper'
require_relative '../../src/data/epics'

Given(/^I have set a connection to pivotal_tracker API service$/) do
  @client = ApiRestClient.new
  @http_connection = @client.get_connection
end

When(/^I send a (GET|DELETE) request to (.*?)$/) do |method, end_point|
	http_request = @client.get_request(method, end_point)
	@http_response = @client.execute_request(@http_connection, http_request)
end

When(/^I send a (PUT|POST) request to (.*?) with json$/) do |method, end_point, json_text|
	http_request = @client.get_request(method, end_point)
	http_request.body = json_text
	@http_response = @client.execute_request(@http_connection, http_request)
end

Then(/^I expect Status code (\d+)$/) do |http_code|
  expect(@http_response.code.to_s).to eql(http_code.to_s)
end