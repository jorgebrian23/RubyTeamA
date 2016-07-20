require 'json/ext'
require_relative '../../../src/helpers/data_helper'
require_relative '../../../src/data/workspaces'
require_relative '../../../src/helpers/rest_client/api_rest_client'

When(/^I send a (GET|DELETE) request Workspaces to (.*?)$/) do |method, end_point|
  @client = ApiRestClient.new
  @http_connection = @client.get_connection
  http_request = @client.get_request(method, end_point)
  @http_response = @client.execute_request(@http_connection, http_request)
  @array_workspaces = Workspaces.get_array(@http_response.body)
end

When(/^I send a (PUT|POST) request Workspaces to (.*?)$/) do |method, end_point, json_text|
  http_request = @client.get_request(method, end_point)
  http_request.body = json_text
  @http_response = @client.execute_request(@http_connection, http_request)
  #@array_workspaces = Workspaces.get_array(@http_response.body)
end


Then(/^Workspaces Verify field kind is a string$/) do
  @array_string = @array_workspaces.map { |workspaces| workspaces.kind }
  expect(DataHelper.is_string_array?(@array_string)).to be true
end
Then(/^Workspaces Verify field id is a integer$/) do
  @array_integer = @array_workspaces.map { |workspaces| workspaces.id }
  expect(DataHelper.is_integer_array?(@array_integer)).to be true
end
Then(/^Workspaces Verify field name is a string$/) do
  @array_string = @array_workspaces.map { |workspaces| workspaces.name }
  expect(DataHelper.is_string_array?(@array_string)).to be true
end
Then(/^Workspaces Verify field person_id is a integer$/) do
  @array_integer = @array_workspaces.map { |workspaces| workspaces.person_id }
  expect(DataHelper.is_integer_array?(@array_integer)).to be true
end
Then(/^Workspaces Verify field project_ids is a array$/) do
  @array = @array_workspaces.map { |workspaces| workspaces.project_ids }
  expect(DataHelper.is_array?(@array)).to be true
end

