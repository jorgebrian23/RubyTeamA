require 'json/ext'
require_relative '../../../src/helpers/rest_client/api_rest_client'
require_relative '../../../src/data/me_details'

When(/^I send a story (GET) request to (.*?)$/) do |method, end_point|
  http_request = @client.get_request(method, end_point)
  @http_response = @client.execute_request(@http_connection, http_request)
end

When(/^I send a story (DELETE) request to (.*?)$/) do |method, end_point|
  http_request = @client.get_request(method, end_point)
  @http_response = @client.execute_request(@http_connection, http_request)
end

When(/^I send a story (POST|PUT) request to (.*?)$/) do |method, end_point, text_JSon|
  http_request = @client.get_request(method, end_point)
  http_request.body = text_JSon
  @http_response = @client.execute_request(@http_connection, http_request)
end

